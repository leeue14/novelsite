package com.leeue.novel.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.leeue.novel.entity.Reader;

/**
 * 未登录拦截器
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月27日 下午3:02:00
 */
public class SecurityInterceptor implements HandlerInterceptor{
	 private static final String LOGIN_URL = "/novelsite/indexview/index";  
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

	   @Override  
	    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {  
	        /*HttpSession session = req.getSession(true);  
	        // 从session 里面获取用户名的信息  
	        Object obj = session.getAttribute(Config.Passport.SESSION_NAME_LOGIN_RESULT);  
	        // 判断如果没有取到用户信息，就跳转到登陆页面，提示用户进行登陆  
	        if (obj == null || "".equals(obj.toString())) {  
	            res.sendRedirect(LOGIN_URL);  
	        }  */
		   Reader reader = (Reader) req.getSession().getAttribute("reader");
		   if (reader == null || "".equals(reader.toString())) {  
	            res.sendRedirect(LOGIN_URL);  
	        } 
	        return true;  
	    }  
	  

}
