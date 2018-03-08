package com.leeue.novel.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.http.client.ClientProtocolException;
import org.springframework.web.bind.annotation.ResponseBody;

public class NetBookApi {
	// 获取网络分类，如玄幻类型
	// gender, type, major(主分类), minor(子分类), start, limit
	public static JSONObject getType(HttpServletRequest request, String gender,
			String type, String major, String minor, int start, int limit)
			throws ClientProtocolException, IOException {
		String data = HttpJsonUtil
				.getJson("http://api.zhuishushenqi.com/book/by-categories?gender="
						+ gender
						+ "&type="+type
						+ "&major="
						+ major
						+ "&minor="
						+ minor + "&start=" + start + "&limit=" + limit);
		if (data != null && !data.equals("")) {
			JSONObject json_test = JSONObject.fromObject(data);
			return json_test;
		}
		return null;
	}

	public static JSONObject searchBook(HttpServletRequest request,
			String bookName) throws ClientProtocolException, IOException {
		String data = HttpJsonUtil
				.getJson("http://novel.juhe.im/search?keyword=" + bookName);
		if (data != null && !data.equals("")) {
			JSONObject json_test = JSONObject.fromObject(data);
			return json_test;
		}
		return null;
	}

	/**
	 * 获取榜单 详情
	 * 
	 * @param request
	 * @param rankId
	 *            榜单ID
	 * @return
	 */
	public static JSONObject getRank(HttpServletRequest request, String rankId) {
		String data;
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			data = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/ranking/"
					+ rankId);
			if (data != null && !data.equals("")) {
				JSONObject json_test = JSONObject.fromObject(data);
				modelMap.put("sale", json_test);
				modelMap.put("success", true);
				return json_test;
			} else {
				modelMap.put("success", false);
			}

		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			return null;
		}
		return null;

	}

	/**
	 * 获取主分类
	 * @param request
	 * @param rankId
	 * @return
	 */
	public static JSONObject getParentCats(HttpServletRequest request) {
		String data;
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			data = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/cats/lv2/statistics");
			if (data != null && !data.equals("")) {
				JSONObject json_test = JSONObject.fromObject(data);
				return json_test;
			} else {
				modelMap.put("success", false);
			}

		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			return null;
		}
		return null;
	}
	/**
	 * 获取 二级分类
	 * @param request
	 * @return
	 */
	public static JSONObject getMinCats(HttpServletRequest request) {
		String data;
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			data = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/cats/lv2");
			if (data != null && !data.equals("")) {
				JSONObject json_test = JSONObject.fromObject(data);
				return json_test;
			} else {
				modelMap.put("success", false);
			}

		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			return null;
		}
		return null;
	}
	/*
	 * public static void main(String[] args) throws ClientProtocolException,
	 * IOException{ System.out.println(NetBookApi.getType(null, "male", "hot",
	 * "玄幻", "东方玄幻", 0, 10)); }
	 */
}
