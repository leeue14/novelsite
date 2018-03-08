package com.leeue.novel.web.index;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.utils.HttpJsonUtil;
import com.leeue.novel.utils.NetBookApi;

/**
 * 进入首页页面
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月6日 下午3:33:07
 */
@Controller
@RequestMapping(value="/indexview",method=RequestMethod.GET)
public class IndexViewController {
	@Autowired
	private IndexController indexController;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String IndexMain(Model model,HttpServletRequest request){
		model.addAttribute("rankmap",indexController.getIndex(request));
		//获取完结榜  经典推荐栏目
		request.setAttribute("finishRank", NetBookApi.getRank(request, "550b836229cd462830ff4d1d"));
		//获取纵横月票榜
		request.setAttribute("recommend", NetBookApi.getRank(request, "54d430962c12d3740e4a3ed2"));
		//获取百度热搜榜
		request.setAttribute("hotSearch", NetBookApi.getRank(request, "564ef4f985ed965d0280c9c2"));
		return "index/index";
	}
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String testView(Model model,HttpServletRequest request){
	
/*		return "admin/login/login";*/
		return "admin/index";
	}
	
	

	

}
