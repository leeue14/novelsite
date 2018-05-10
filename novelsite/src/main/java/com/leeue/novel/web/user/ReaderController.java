                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      package com.leeue.novel.web.user;


import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.dao.ReaderDao;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.ReaderService;
import com.leeue.novel.utils.CodeUtils;
import com.leeue.novel.utils.DateFormat;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.RegexUtil;

@Controller
@RequestMapping("/readeroperation")
public class ReaderController {

	@Autowired
	private ReaderService readerService;

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registReader(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		if (!CodeUtils.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "验证码错误,请重新输入");
			return modelMap;
		}
		// 接受前端传进来的数据
		String readerStr = HttpServletRequestUtil.getString(request, "reader");
		ObjectMapper mapper = new ObjectMapper();
		Reader reader = null;
		try {
			reader = mapper.readValue(readerStr, Reader.class);
			if (!RegexUtil.testEmail(reader.getEmail())) {
				modelMap.put("success", false);
				modelMap.put("errMsg", "邮箱格式错误");
				return modelMap;
			}
			Reader havaReader = readerService.queryReader(reader.getEmail());
			if (havaReader != null
					&& havaReader.getEmail().equals(reader.getEmail())) {
				modelMap.put("success", false);
				modelMap.put("errMsg", "该邮箱已被注册");
				return modelMap;
			}
			if (!RegexUtil.testPassword(reader.getPassword())) {
				modelMap.put("success", false);
				modelMap.put("errMsg", "密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线");
				return modelMap;
			}
			reader.setCreateTime(DateFormat.FormatDateSupport(new Date()));
			readerService.insertReader(reader);
			modelMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("success", false);
			modelMap.put("errMsg", e.getMessage());
			return modelMap; // 失败返回
		}
		return modelMap;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loginReader(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		if (!CodeUtils.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "验证码错误,请重新输入");
			return modelMap;
		}
		// 接受前端传进来的数据
		String readerStr = HttpServletRequestUtil.getString(request, "reader");
		ObjectMapper mapper = new ObjectMapper();
		Reader reader = null;
		try {
			reader = mapper.readValue(readerStr, Reader.class);
			if (!RegexUtil.testEmail(reader.getEmail())) {
				modelMap.put("success", false);
				modelMap.put("errMsg", "邮箱格式错误");
				return modelMap;
			}
			Reader havaReader = readerService.queryReader(reader.getEmail());
			if (!RegexUtil.testPassword(reader.getPassword())) {
				modelMap.put("success", false);
				modelMap.put("errMsg", "密码错误");
				return modelMap;
			}
			if(havaReader!=null && havaReader.getStatus()==0){
				modelMap.put("success", false);
				modelMap.put("errMsg", "该账号已被禁止登录");
				return modelMap;
			}
			if (havaReader != null
					&& havaReader.getEmail().equals(reader.getEmail())) {
				//把登录的信息存入session中
				request.getSession().setAttribute("reader", havaReader);

				modelMap.put("success", true);
				boolean flag = HttpServletRequestUtil.getBoolean(request,
						"flag");
				if (flag) {
					Cookie autologin = new Cookie("autologin",
							reader.getEmail() + ":" + reader.getPassword());
					autologin.setMaxAge(3600 * 24 * 30);
					response.addCookie(autologin);
					modelMap.put("redirect", true);
					modelMap.put("url", "/novelsite/indexview/index");
				}
				return modelMap;
			}else{
				modelMap.put("success", false);
				modelMap.put("errMsg", "该账号不存在");
				return modelMap;
			}

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("success", false);
			modelMap.put("errMsg", e.getMessage());
			return modelMap; // 失败返回
		}
	//	return modelMap;
	}
	
	/**
	 * 退出
	 * @param request
	 * @return
	 */
	
	@RequestMapping(value="/loginout", method=RequestMethod.POST)//直接点击
	@ResponseBody
	public Map<String, Object> loginOut(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Reader reader = (Reader) request.getSession().getAttribute("reader");
		if(reader!=null){
			request.getSession().removeAttribute("reader");
			modelMap.put("redirect", true);
			modelMap.put("url", "/novelsite/indexview/index");
			modelMap.put("success", true);
			return modelMap;
		}else{
			modelMap.put("success", false);
			modelMap.put("errMsg", "没有登陆");
			return modelMap; // 失败返回
		}
		
	}

	// 勾选了自动登录
	@RequestMapping(value = "/autologin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> autologinReader(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();

		return modelMap;
	}
	
	
	
	
	/**
	 * 查询所有的读者
	 */
	
	@RequestMapping(value = "/findalluser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findalluser(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<Reader> readers = readerService.queryAllReader(null);
		System.out.println(readers);
		request.setAttribute("readers", readers);
		
		modelMap.put("readers", readers);
		modelMap.put("readers", readers);
		return modelMap;
	}
}
