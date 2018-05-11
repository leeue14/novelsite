package com.leeue.novel.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.leeue.novel.entity.Reader;

/***
 * 
 * 功能:检测是否登录拦截  暂时不做
 * @author:李月
 * @Version:
 * @Date 2018年5月10日 下午4:12:10
 */
public class LoginInterceptor implements HandlerInterceptor{

	private static String LOGIN_URL = "/novelsite/indexview/index";
	/**
	 * 拦截验证全部放在这里
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		//1 获取当前请求的url地址
		String requestUrl = request.getRequestURI();
		//2 判断是否是公开的url地址
		if(requestUrl.contains("indexview/index")||requestUrl.contains("common")||
				requestUrl.contains("resources")){
			//如果包含就放行
			return true;
		}
		Reader reader = (Reader) request.getSession().getAttribute("reader");
		if(reader != null && reader.getEmail()!=null){
			return true;//放行说明已经登录了
		}
		
		//没有登录
	//	response.sendRedirect("/novelsite/admin");
		request.getRequestDispatcher("/novelsite/indexview/index").forward(request, response);;
		return false;
	}
	
	
	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
