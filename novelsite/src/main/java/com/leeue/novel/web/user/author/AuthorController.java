package com.leeue.novel.web.user.author;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ch.qos.logback.classic.spi.STEUtil;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.dao.AuthorDao;
import com.leeue.novel.entity.Author;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.AuthorService;
import com.leeue.novel.utils.CodeUtils;
import com.leeue.novel.utils.DateFormat;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.RegexUtil;

@Controller
@RequestMapping(value="/authoroperation")
public class AuthorController {
	
	@Autowired
	private AuthorService authorService;
	@RequestMapping(value="/queryauthor",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAuthor(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Long readerId = HttpServletRequestUtil.getLong(request, "readerId");
		System.out.println(readerId);
		Author author = authorService.queryAuthorById(readerId);
		
		
		if(author == null){
		
			modelMap.put("success", false);
			modelMap.put("errMsg", "你还没有注册作者");
			modelMap.put("url", 1);
			return modelMap;
		}else if(author.getStatus() == 0){
			modelMap.put("success", false);
			modelMap.put("errMsg", "该账号已被禁用作者功能");
			modelMap.put("url", 2);
			return modelMap;
		}else{
			modelMap.put("success", true);
			try {
				request.getSession().setAttribute("nowDate", DateFormat.FormatDateSupport(new Date()));
			} catch (ParseException e) {                                                                                                                
				e.printStackTrace();
			}
			request.getSession().setAttribute("author", author);
			modelMap.put("redirect", true);
			modelMap.put("url", "/novelsite/author/authorcenter");
			return modelMap;
		}
		
	}
	
	@RequestMapping(value="/registauthor",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registAuthor(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Reader reader = (Reader) request.getSession().getAttribute("reader");
		if(reader == null){
			modelMap.put("success", false);
			modelMap.put("errMsg", "您还没有登录");
			return modelMap;
		}
		if (!CodeUtils.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "验证码错误,请重新输入");
			return modelMap;
		}
		String authorStr = HttpServletRequestUtil.getString(request, "author");
		ObjectMapper mapper = new ObjectMapper();
		Author author = null;
		try {
			author = mapper.readValue(authorStr, Author.class);
			author.setReaderId(reader.getReaderId());//放入作者id
			if(!RegexUtil.testPenName(author.getPenName())){
				modelMap.put("success", false);
				modelMap.put("errMsg", "笔名格式错误");
				return modelMap;
			}
			Author haveAuthor = authorService.queryAuthorPenName(author.getPenName());
			if(haveAuthor != null && haveAuthor.getPenName()!=null){
				modelMap.put("success", false);
				modelMap.put("errMsg", "该笔名已被注册");
				return modelMap;
			}
			if(!RegexUtil.testName(author.getRealName())){
				modelMap.put("success", false);
				modelMap.put("errMsg", "姓名格式错误");
				return modelMap;
			}
			if(!RegexUtil.testIDcard(author.getIdCard())){
				modelMap.put("success", false);
				modelMap.put("errMsg", "身份证号码填写不正确");
				return modelMap;
			}
			Author idAuthor = authorService.queryAuthorIdCard(author.getIdCard());
			if(idAuthor != null && idAuthor.getIdCard()!=null){
				modelMap.put("success", false);
				modelMap.put("errMsg", "该身份账号已被注册");
				return modelMap;
			}
			if(!RegexUtil.testPhone(author.getPhone())){
				modelMap.put("success", false);
				modelMap.put("errMsg", "手机号码填写不正确");
				return modelMap;
			}
			if(!RegexUtil.testEmail(author.getEmail())){
				modelMap.put("success", false);
				modelMap.put("errMsg", "邮箱格式错误");
				return modelMap;
			}
			if(!RegexUtil.testQQnum(author.getQqNum())){
				modelMap.put("success", false);
				modelMap.put("errMsg", "QQ号码格式错误");
				return modelMap;
			}
			modelMap.put("success", true);
			author.setCreateTime(DateFormat.FormatDateSupport(new Date()));
			author.setStatus(1);
			authorService.insertAuthor(author);
			request.getSession().setAttribute("nowDate", DateFormat.FormatDateSupport(new Date()));
			request.getSession().setAttribute("author", author);
			return modelMap;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return modelMap;
	}
}
