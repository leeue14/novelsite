package com.leeue.novel.web.admin.usermanage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leeue.novel.entity.Admin;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.ReaderService;
@Controller
@RequestMapping(value="usermanage")
public class UsermanageViewControl {
	
	/**
	 * 进入用户管理中心
	 */
	@Autowired
	ReaderService readerService;
	@RequestMapping(value="usermanageindex")
	public String usermanageIndex(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<Reader> readers = readerService.queryAllReader();
		System.out.println(readers);
		request.setAttribute("readers", readers);
		
		modelMap.put("readers", readers);
		modelMap.put("readers", readers);
		return "admin/usermanage/usermanage";
	}
}
