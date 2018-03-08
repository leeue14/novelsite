package com.leeue.novel.web.comment;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.entity.Comment;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.CommentService;
import com.leeue.novel.utils.CodeUtils;
import com.leeue.novel.utils.DateFormat;
import com.leeue.novel.utils.HttpServletRequestUtil;

@Controller
@RequestMapping(value="/comment")
public class CommentControl {
	
	@Autowired
	CommentService commentService;
	
	/**
	 * 发布评论
	 * @param request
	 * @return
	 */
	@RequestMapping(value="addcomment")
	@ResponseBody
	public Map<String, Object> addComment(HttpServletRequest request){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		if (!CodeUtils.checkVerifyCode(request)) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "验证码错误,请重新输入");
			return modelMap;
		}
		Reader reader = (Reader) request.getSession().getAttribute("reader");
		if(reader== null ){
			modelMap.put("success", false);
			modelMap.put("errMsg", "前往首页登陆后再操作");
			return modelMap;
		}
		//接受前端传来的数据
		String commentStr = HttpServletRequestUtil.getString(request, "commentStr");
		String bookId = HttpServletRequestUtil.getString(request, "bookId");
		String bookTitle = HttpServletRequestUtil.getString(request, "bookTitle");
		ObjectMapper mapper = new ObjectMapper();
		Comment comment = null;
		try {
			List comments = commentService.queryAllComment();
			comment = mapper.readValue(commentStr, Comment.class);
			//添加评论初始数据
			comment.setBookId(bookId);
			comment.setReaderId(reader.getReaderId());
			comment.setNickName(reader.getNickName());
			comment.setDate(DateFormat.FormatDateHaveSec(new Date()));
			comment.setBookName(bookTitle);
			comment.setPriority(comments.size());
			//插入评论
			commentService.insertComment(comment);
			modelMap.put("success", true);
			return modelMap;
			/*comment.setBookId();*/
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("errMsg", e.getMessage());
			modelMap.put("success", false);
			return modelMap;
		
		}

	}
}
