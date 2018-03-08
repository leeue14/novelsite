package com.leeue.novel.web.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leeue.novel.entity.Admin;
import com.leeue.novel.entity.Reader;

@Controller
@RequestMapping(value="admin")
public class AdminViewCotrol {
	
	@RequestMapping(value="adminlogin")
	public String adminLogin(HttpServletRequest request,HttpServletResponse response){
		
		return "admin/login/login";
	}
	
	@RequestMapping(value="adminindex")
	public String adminIndex(HttpServletRequest request,HttpServletResponse response){
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin == null){
			try {
				response.sendRedirect("/novelsite/admin/adminlogin");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "admin/index";
	}
	
	@RequestMapping(value="adminloginout")
	public String adminLoginOut(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("admin");
		return "admin/login/login";
	}
	
}
