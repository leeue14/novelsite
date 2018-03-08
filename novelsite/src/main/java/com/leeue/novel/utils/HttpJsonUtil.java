package com.leeue.novel.utils;

import java.io.IOException;



import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

public class HttpJsonUtil {
	
	/**
	 * 从api中获得json文本
	 * @param url
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static String getJson(String url) throws ClientProtocolException, IOException{
	
		String str = EntityUtils.toString(getHttpResponse(url).getEntity());
	//	System.out.println(str);
		return str;
	}
	
	/**
	 * 获得返回的Reponse
	 * @param url
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static CloseableHttpResponse getHttpResponse(String url) throws ClientProtocolException, IOException{
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		CloseableHttpResponse httpResponse = httpClient.execute(new HttpGet(url));
		return httpResponse;
	}
	
	
	/**
	 * 处理json字符串有空值
	 */
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static JSONObject  replaceNUll(JSONObject jsonData){
		for(Object map: jsonData.entrySet()){
			Object key = ((Map.Entry)map).getKey();
			if(((Map.Entry)map).getValue() == null){
				((Map.Entry)map).setValue("null");
			}
		}
		return jsonData;
	}
}
