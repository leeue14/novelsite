package com.leeue.novel.web.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.entity.Admin;
import com.leeue.novel.entity.Author;
import com.leeue.novel.service.AdminService;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.RegexUtil;

@Controller
@RequestMapping(value = "adminoperation")
public class AdminControl {

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "adminlogin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminLogin(HttpServletRequest request,
			HttpServletResponse response) {

		Map modelMap = new HashMap<String, Object>();
		String email = HttpServletRequestUtil.getString(request, "email");
		String password = HttpServletRequestUtil.getString(request, "password");
		/*
		 * if(RegexUtil.testEmail(email)){ modelMap.put("success", false);
		 * modelMap.put("errMsg", "email格式错误"); }
		 */
		Admin admin = adminService.findAdmin(email);
		if (admin == null) {
			modelMap.put("success", false);
			modelMap.put("errMsg", "用户不存在");
			return modelMap;
		}
		if (admin.getPassword().equals(password)) {

			request.getSession().setAttribute("admin", admin);

			modelMap.put("success", true);
			modelMap.put("url", "/novelsite/admin/adminindex");
			return modelMap;

		} else {
			modelMap.put("success", false);
			modelMap.put("errMsg", "email或密码错误");
			return modelMap;
		}
	}
}
