package com.leeue.novel.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 处理地址栏里的url
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月26日 下午1:23:32
 */
public class HttpUrl {
	
	/**
	 * 对url 重新编码
	 * @param url
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String encode(String url) throws UnsupportedEncodingException {
		if(url.contains("&")){
			url = url.replace("&", "*");
		}
		String encodingUrl = URLEncoder.encode(url,"UTF-8");
		if(encodingUrl.contains("*")){
			encodingUrl = encodingUrl.replace("*", "&");
		}
		System.out.println(url);
		System.out.println("---"+encodingUrl);
		return encodingUrl;
	}
	
	/**
	 * 对地址栏里面的url重新拼接
	 */
	
	public static String getAddressUrl(HttpServletRequest request){
		String url = "";
		Map<String, String> map = new HashMap<>();
		Enumeration paramNames = request.getParameterNames();
		boolean flag = true;
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			System.out.println("--" + paramName+"="+request.getParameterValues(paramName));
			String[] paramValues = request.getParameterValues(paramName);
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if(paramName.equals("index")){//目录的分页 index 不需要解析在url内
					continue;
				}
				if(url.contains("http")){
					url+= "&" + paramName + "=" + paramValue;
				}
				if (flag && paramName.equals("url")) {
					url = paramValue;
					flag = false;
				}
				
			}
		}
		System.out.println("拼接后的url"+url);
		return url;
	}
}
