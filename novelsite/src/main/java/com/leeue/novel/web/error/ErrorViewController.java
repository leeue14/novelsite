package com.leeue.novel.web.error;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/error",method=RequestMethod.GET)
public class ErrorViewController {
	@RequestMapping(value="/error",method=RequestMethod.GET)
	public String testView(Model model,HttpServletRequest request){
	
		return "error/404";
	}
	
}
