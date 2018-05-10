package com.leeue.novel.web.user.author;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leeue.novel.entity.News;
import com.leeue.novel.service.NewsService;

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
	
	@Autowired
	NewsService newsService;
	@RequestMapping(value="regist",method=RequestMethod.GET)
	public String regist(Model model,HttpServletRequest request){
		return "authorregist/authorregist";
	}
	@RequestMapping(value="authorcenter",method=RequestMethod.GET)
	public String authorCenter(HttpServletRequest request){
		//查找新闻放入
		List<News> newsList = newsService.findTenNews();
		request.setAttribute("xinwen", newsList);
		
		System.out.println("-----"+newsList.size());
		return "authorcenter/authorcenter";
	}
	
	

}
