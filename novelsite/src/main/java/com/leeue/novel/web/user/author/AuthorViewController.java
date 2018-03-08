package com.leeue.novel.web.user.author;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * 功能:作者界面管理
 * @author:李月
 * @Version:
 * @Date 2018年1月30日 上午11:38:41
 */
@Controller
@RequestMapping(value="/author",method=RequestMethod.GET)
public class AuthorViewController {
	
	@RequestMapping(value="regist",method=RequestMethod.GET)
	public String regist(Model model,HttpServletRequest request){
		return "authorregist/authorregist";
	}
	@RequestMapping(value="authorcenter",method=RequestMethod.GET)
	public String authorCenter(Model model,HttpServletRequest request){
		return "authorcenter/authorcenter";
	}
	
	

}
