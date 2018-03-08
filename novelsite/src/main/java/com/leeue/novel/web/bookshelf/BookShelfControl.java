package com.leeue.novel.web.bookshelf;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.entity.BookShelf;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.BookShelfService;
import com.leeue.novel.utils.HttpServletRequestUtil;

/**
 * 对书架的操作 异步请求 功能:
 * 
 * @author:李月
 * @Version:
 * @Date 2018年2月27日 下午5:02:49
 */
@Controller
@RequestMapping(value = "bookshelfoperation")
public class BookShelfControl {

	@Autowired
	BookShelfService bookShelfService;

	@RequestMapping(value="insertbookshelf")
	@ResponseBody
	public Map<String, Object> insertBookShelf(HttpServletRequest request,
			HttpServletResponse response) {

		Map<String, Object> modelMap = new HashMap<String, Object>();

		Reader reader = (Reader) request.getSession().getAttribute("reader");// 首先看是否登录了
		if (reader == null) {
			//没有登录操作此功能
			modelMap.put("success", false);
			modelMap.put("errMsg", "登录后使用此功能");
		
			return modelMap;
			
		} else {
			
			String bookShelfStr = HttpServletRequestUtil.getString(request, "bookShelf");
			ObjectMapper mapper = new ObjectMapper();
			BookShelf bookShelf = null;
			try {
				bookShelf = mapper.readValue(bookShelfStr, BookShelf.class);
				int total = bookShelfService.queryAllBookByReaderId(reader.getReaderId());
				bookShelf.setPriority(total+1);
				bookShelf.setReaderId(reader.getReaderId());
				BookShelf  haveBookShelf = null;
				haveBookShelf = bookShelfService.queryBookShelfById(bookShelf.getBookId(), reader.getReaderId());
				System.out.println("--"+haveBookShelf);
				if(haveBookShelf != null){
					bookShelfService.updateBookShelfById(bookShelf);
				}else {
					bookShelfService.insertBookInBookShelf(bookShelf);
				}
			} catch ( IOException e) {
				modelMap.put("success", false);
				modelMap.put("errMsg", "加入书架错误");
				e.printStackTrace();
				return modelMap;
			}
			modelMap.put("success", true);
			modelMap.put("errMsg", "加入书架成功");
			return modelMap;
		}
	
	}
	
	
	@RequestMapping(value="deletebookshelf")
	@ResponseBody
	public Map<String, Object> deleteBookShelf(HttpServletRequest request,
			HttpServletResponse response) {

		Map<String, Object> modelMap = new HashMap<String, Object>();

		Reader reader = (Reader) request.getSession().getAttribute("reader");// 首先看是否登录了
		if (reader == null) {
			//没有登录操作此功能
			modelMap.put("success", false);
			modelMap.put("errMsg", "登录后使用此功能");
			try {
				response.sendRedirect("/novelsite/indexview/index");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return modelMap;
			
		} else {
			
			//从地址栏获取书架书籍id
			long bookShelfId = HttpServletRequestUtil.getLong(request, "bookShelfId");
			bookShelfService.deleteBookShelfById(bookShelfId);
			modelMap.put("success", true);
			/*modelMap.put("errMsg", "移除成功");*/
			return modelMap;
		}
	
	}
	
	
}
