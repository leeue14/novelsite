package com.leeue.novel.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * 功能: 解析request对象传过来的值
 * @author:李月
 * @Version:
 * @Date 2018年1月5日 上午1:19:15
 */
public class HttpServletRequestUtil {
	/**
	 * request里面有许多key将其转换成整型
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getInt(HttpServletRequest request, String key) {
		try {
			return Integer.decode(request.getParameter(key));
		} catch (Exception e) {
			e.printStackTrace(); // 转换失败返回-1
			return -1;
		}

	}

	public static long getLong(HttpServletRequest request, String key) {

		try {
			return Long.valueOf(request.getParameter(key));
		} catch (Exception e) {
			return -1;
		}

	}

	public static double getDouble(HttpServletRequest request, String key) {

		try {
			return Double.valueOf(request.getParameter(key));
		} catch (Exception e) {
			return -1;
		}

	}

	public static boolean getBoolean(HttpServletRequest request, String key) {

		try {
			return Boolean.valueOf(request.getParameter(key));
		} catch (Exception e) {
			return false;
		}

	}

	public static String getString(HttpServletRequest request, String key) {

		try {
			String result = request.getParameter(key);
			if(result != null){
				result = result.trim();
			}
			if("".equals(result)){
				result = null;
			}
			return result;
		} catch (Exception e) {
			return null;
		}

	}
}