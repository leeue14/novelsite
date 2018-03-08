package com.leeue.novel.web.netbook;

import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.ibatis.javassist.bytecode.stackmap.MapMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.utils.DateFormat;
import com.leeue.novel.utils.HttpJsonUtil;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.HttpUrl;

@Controller
@RequestMapping("/bookoperation")
public class BookController {
	
	/**
	 * 获取书籍简介页面
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/bookinfo",method = RequestMethod.GET)
	public Map<String, Object> getBookInfo(HttpServletRequest request){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String bookId = HttpServletRequestUtil.getString(request, "bookid");
		
		request.getSession().setAttribute("bookid", bookId);
		try {
			String data = HttpJsonUtil.getJson("http://novel.juhe.im/book-info/"+bookId);
			System.out.println(data);
			if(data!=null && !data.equals("")){
				@SuppressWarnings("unchecked")
				String dataStr = data.replace("null", "\"\"");
				JSONObject bookinfo = JSONObject.fromObject(dataStr);
				String updateStr = ((JSONObject)bookinfo.get("data")).getString("updated");
				
			//	updateStr = DateFormat.FormatDateSupport(updateStr);
				
			//	System.out.println("------------"+updateStr);
				modelMap.put("update", updateStr);
				modelMap.put("bookinfo", bookinfo);
				modelMap.put("success", true);
			}
			return modelMap;
		} catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			e.printStackTrace();
			return modelMap;
		}
	}
	/**
	 * 获取书籍来源站
	 */
	@RequestMapping(value="/getbooksite",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getBookSite(HttpServletRequest request){
		Map<String, Object> modelMap = new HashMap<String,Object>();
		
		try {
			String bookId = HttpServletRequestUtil.getString(request, "bookid");
			String data = HttpJsonUtil.getJson("http://novel.juhe.im/book-sources?view=summary&book="+bookId);
			JSONObject siteInfo = JSONObject.fromObject(data);
			modelMap.put("siteinfo", siteInfo);
			modelMap.put("success", true);
			return modelMap;
		} catch (Exception e) {
			modelMap.put("success", false);
			modelMap.put("errMsg", e.getMessage());
		}
		return modelMap;
	}
	
	
	/**
	 * 获取小说某一个章节内容
	 */
	@RequestMapping(value="/getchapterdetail",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getChapterDetail(HttpServletRequest request, String url){
		Map<String, Object> modelMap = new HashMap<>();
		Map<String, String> map = new HashMap<>();
		
		try {
			if(url == null ){
				url = HttpServletRequestUtil.getString(request, url);
				
				
				url = HttpUrl.getAddressUrl(request);
			}
			String encodeUrl = HttpUrl.encode(url);
			String jsonData = HttpJsonUtil.getJson("http://chapter2.zhuishushenqi.com/chapter/"+encodeUrl);
			JSONObject chapterDetail = JSONObject.fromObject(jsonData);
			System.out.println(chapterDetail);
			String chapterBody = null;
			if(encodeUrl.contains("vip.zhuishushenqi.com")){//如果是加密书源就返回加密书源解析错误
				chapterBody = (String) ((JSONObject)chapterDetail.get("chapter")).get("cpContent");
				chapterBody = "加密书源,请登录www.zhuishushenqi.com查看";
			}else{
			//	System.out.println("jsonData"+jsonData);
				
				chapterBody = (String) ((JSONObject)chapterDetail.get("chapter")).get("body");
			
				chapterBody = stripHtml(chapterBody);
			}
		//	
			modelMap.put("chapterDetail", chapterDetail);
			modelMap.put("chapterbody", chapterBody);
			modelMap.put("success", true);
			return modelMap;
		} catch (Exception e) {
			//modelMap.put("chapterDetail", chapterDetail);
			modelMap.put("chapterbody", "章节内容获取失败，请更换");
			modelMap.put("success", true);
			modelMap.put("success", false);
			modelMap.put("errMsg", e.getMessage());
		//	e.printStackTrace();
		}
		
		
		return modelMap;
	}
	
	/**
	 * 获取小说最后一章链接
	 */
	@RequestMapping(value="/getlastchapterurl",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getLastChapterUrl(HttpServletRequest request){
		Map<String, Object> modelMap = new HashMap<>();
		try {
			String hostId = (String) request.getAttribute("hostid");
			System.out.println("hostId="+hostId);
			System.out.println("url="+"http://api.zhuishushenqi.com/toc/"+hostId+"?view=chapters");
			String jsonData = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/toc/"+hostId+"?view=chapters");
			JSONObject data = JSONObject.fromObject(jsonData);
		//	System.out.println("+++++"+jsonData);
			@SuppressWarnings("unchecked")
			List<Object> lastChapter = (List<Object>) data.get("chapters");
			String link =  ((JSONObject) lastChapter.get(lastChapter.size()-1)).getString("link");
			String title = ((JSONObject) lastChapter.get(lastChapter.size()-1)).getString("title");
			System.out.println("lastLink="+link);
			/*for (int i = 0; i < lastChapter.size(); i++) {
				System.out.println(((JSONObject)lastChapter.get(i)).getString("link"));
			}*/
			modelMap.put("lastindex", lastChapter.size()-1);
			modelMap.put("lastchapterlink", link);
			modelMap.put("lastchaptertitle", title);
			/*System.out.println("++++"+modelMap);*/
			modelMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelMap;
	}
	/**
	 * 获取小说目录
	 */
	@RequestMapping(value="/getbookcatalog",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getBookCatalog(HttpServletRequest request){
		Map<String, Object> modelMap = new HashMap<>();
		try {
			String hostId = (String) request.getSession().getAttribute("hostid");
			System.out.println("hostId="+hostId);
			System.out.println("url="+"http://api.zhuishushenqi.com/toc/"+hostId+"?view=chapters");
			String jsonData = HttpJsonUtil.getJson("http://api.zhuishushenqi.com/toc/"+hostId+"?view=chapters");
			JSONObject data = JSONObject.fromObject(jsonData);
		//	System.out.println("+++++"+jsonData);
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> chapters = (List<Map<String, Object>>) data.get("chapters");
			
			/*//对下一页和上一页的处理
			List<String> nextchapters = new ArrayList<String>();
			List<String> prechapters = new ArrayList<String>();
			for (int i = 0; i < chapters.size(); i++) {
				if(i >= 0 && i < chapters.size()-1){
					String nextLink = ((JSONObject)chapters.get(i+1)).getString("link");
					nextchapters.add(nextLink);
				}else {
					String nextLink = "#";
					nextchapters.add(nextLink);
				}
				//对上一页处理
				if(i >= 0 && i < chapters.size()-1){
					String nextLink = ((JSONObject)chapters.get(i+1)).getString("link");
					nextchapters.add(nextLink);
				}else {
					String nextLink = "#";
					nextchapters.add(nextLink);
				}
				System.out.println();
			}*/
		//	modelMap.put("chapters", link);
			
			modelMap.put("chapters", chapters);
			/*System.out.println("++++"+modelMap);*/
			modelMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelMap;
	}
	
	
	
	/**
	 * 后期处理成utils
	 **/
	public static String stripHtml(String content) { 
		// <p>段落替换为换行 
		content = content.replaceAll("<p .*?>", "\r\n"); 
		// <br><br/>替换为换行 
		content = content.replaceAll("<br\\s*/?>", "\r\n"); 
		// 去掉其它的<>之间的东西 
		content = content.replaceAll("\\<.*?>", ""); 
		//去掉&amp; bp;
		content = content.replaceAll("&amp;", "  ");
		content = content.replaceAll("bp;", "");
		// 还原HTML 
		// content = HTMLDecoder.decode(content); 
		return content; 
		}
	
}
