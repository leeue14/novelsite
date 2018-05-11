package com.leeue.novel.web.admin;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;




import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.entity.Admin;
import com.leeue.novel.entity.Author;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.AdminService;
import com.leeue.novel.utils.DateFormat;
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
	
	@RequestMapping(value="/addadmin",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addAdmin(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<>();
		//接受前端传来的数据
		
		String adminStr = HttpServletRequestUtil.getString(request, "newAdmin");
		ObjectMapper mapper = new ObjectMapper();
		Admin admin = null;
		try {
			admin = mapper.readValue(adminStr,Admin.class);
			if(admin!=null){
				if (!RegexUtil.testEmail(admin.getEmail())) {
					modelMap.put("success", false);
					modelMap.put("errMsg", "邮箱格式错误");
					return modelMap;
				}
				Admin havaAdmin = adminService.findAdmin(admin.getEmail());
				if (havaAdmin != null
						&& havaAdmin.getEmail().equals(admin.getEmail())) {
					modelMap.put("success", false);
					modelMap.put("errMsg", "该邮箱已被注册");
					return modelMap;
				}
				if (!RegexUtil.testPassword(admin.getPassword())) {
					modelMap.put("success", false);
					modelMap.put("errMsg", "密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线");
					return modelMap;
				}
				
				adminService.insertAdmin(admin);
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("success", false);
			modelMap.put("errMsg", e.getMessage());
			return modelMap; // 失败返回
		}
		
		modelMap.put("success", true);
		return modelMap; // 失败返回
	}
}
