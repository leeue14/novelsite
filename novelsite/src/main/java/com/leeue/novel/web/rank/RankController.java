package com.leeue.novel.web.rank;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.http.client.ClientProtocolException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.utils.HttpJsonUtil;

/**
 * 
 * 功能:排行榜操作
 * @author:李月
 * @Version:
 * @Date 2018年1月3日 下午6:30:50
 */
@Controller
@RequestMapping("/rank")
public class RankController {
	
	/**
	 * 获取本周强推    本周潜力榜
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getweekrank",method=RequestMethod.GET)
	public Map<String, Object>getWeekRank(HttpServletRequest request){
		String data;
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			data = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/ranking/54d42d92321052167dfb75e3");
			if(data!=null && !data.equals("")){
				JSONObject json_test = JSONObject.fromObject(data);
				modelMap.put("week", json_test);
				modelMap.put("success", true);
			}else {
				modelMap.put("success", false);
			}
			return modelMap;
		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			return modelMap;
		} 
		
	}
	
	
	/**
	 * 获取原创销售榜  起点月票榜
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getsalerank",method=RequestMethod.GET)
	public Map<String, Object>getSaleRank(HttpServletRequest request){
		String data;
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			data = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/ranking/54d4306c321052167dfb75e4");
			if(data!=null && !data.equals("")){
				JSONObject json_test = JSONObject.fromObject(data);
				modelMap.put("sale", json_test);
				modelMap.put("success", true);
			}else {
				modelMap.put("success", false);
			}
			return modelMap;
		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			return modelMap;
		} 
		
	}
	
	/**
	 * 判断此书是否只有一个网站，如果是则不显示
	 */
	
	
	
	/**
	 * 大家都在看
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/gethotrank",method=RequestMethod.GET)
	public Map<String, Object>getHotRank(HttpServletRequest request){
		String data;
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			data = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/ranking/54d42d92321052167dfb75e3");
			if(data!=null && !data.equals("")){
				JSONObject json_test = JSONObject.fromObject(data);
				modelMap.put("sale", json_test);
				modelMap.put("success", true);
			}else {
				modelMap.put("success", false);
			}
			return modelMap;
		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			return modelMap;
		} 
		
	}
	

	
}
