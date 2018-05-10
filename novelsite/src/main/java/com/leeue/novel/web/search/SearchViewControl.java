package com.leeue.novel.web.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leeue.novel.dao.LocalBookDao;
import com.leeue.novel.entity.Book;
import com.leeue.novel.entity.PageBean;
import com.leeue.novel.service.LocalBookService;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.NetBookApi;

@Controller
@RequestMapping(value = "/search")
public class SearchViewControl {

	@Autowired
	LocalBookService localBookService;

	@RequestMapping(value = "/searchindex", method = RequestMethod.GET)
	public String searchIndex(HttpServletRequest request) {
		/*
		 * //获取本地全部书籍 List<Book> localBooks =
		 * localBookService.queryBookByCondition(null);
		 * request.getSession().setAttribute("localBooks", localBooks);
		 */
		PageBean<Object> bookPageBean = (PageBean<Object>)request.getAttribute("bookPageBean");
		System.out.println(bookPageBean == null);
		try {
				int pageNum = Integer.valueOf(request.getParameter("pageNum"));
	
				int pageSize = 20;
				int startIndex = (pageNum-1) * pageSize;
				if(startIndex > 1000){
					startIndex = 999;
				}
				System.out.println(startIndex+"startIndex");
				JSONObject indexTypeOne = NetBookApi.getType(request, "male",
						"hot", "玄幻", "",startIndex, 20);
				int totalRecord = indexTypeOne.getInt("total");//获取总的书籍数
			
				//分页处理
				bookPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
				List<Object> netBooks = indexTypeOne.getJSONArray("books");
				bookPageBean.setList(netBooks);
				System.out.println("netBoos"+netBooks.size());
				request.setAttribute("bookPageBean", bookPageBean);
				request.setAttribute("typeName", "玄幻小说推荐");
				request.setAttribute("pageLink", "/novelsite/search/searchindex");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "search/search";
	}
	
	@RequestMapping(value = "/searchbook", method = RequestMethod.GET)
	public String findBook(HttpServletRequest request) {
		String bookName = HttpServletRequestUtil.getString(request, "bookName");
		
		//获取本地书籍
		
		List<Book> localBooks = localBookService.queryLikeBook(bookName);
		
		//获取网络书籍
		try {
			JSONObject jsonBooks = NetBookApi.searchBook(request, bookName);
			List<Object> netBooks = jsonBooks.getJSONArray("books");
			List<Object> allBooks = new ArrayList<>();
			//网络书籍和本地书籍合并
			
			//添加汇总
			allBooks.addAll(localBooks);
			allBooks.addAll(netBooks);
			int totalRecord = allBooks.size();//获取总的书籍数
			//分页处理
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			System.out.println("pagenum"+pageNum); 
			int pageSize = 20;
			int startIndex = (pageNum-1) * pageSize;
			int toIndex = startIndex+pageSize;
			if(startIndex+pageSize > totalRecord){
				toIndex = totalRecord;
			}
			
			List<Object> subList = allBooks.subList(startIndex, toIndex);
			System.out.println("分割出来"+subList.size());
			PageBean<Object> bookPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
			bookPageBean.setList(subList);
			System.out.println("netBooks"+subList.size());
			request.setAttribute("bookPageBean", bookPageBean);
			request.setAttribute("typeName", '"'+bookName+'"'+" 搜索结果");
			request.setAttribute("bookName", bookName);
			request.setAttribute("pageLink", "/novelsite/search/searchbook");
		}  catch (Exception e) {
			e.printStackTrace();
		}
		return "search/search";
	}
	
	
	
}
