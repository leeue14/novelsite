package com.leeue.novel.web.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leeue.novel.entity.BookShelf;
import com.leeue.novel.entity.Comment;
import com.leeue.novel.entity.PageBean;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.BookShelfService;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.NetBookApi;

/**
 * 进入首页页面 功能:
 * 
 * @author:李月
 * @Version:
 * @Date 2018年1月6日 下午3:33:07
 */
@Controller
@RequestMapping(value = "/usercenter", method = RequestMethod.GET)
public class ReaderViewController {

	@Autowired
	BookShelfService bookShelfService;

	/**
	 * 进入个人中心首页
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String IndexMain(Model model, HttpServletRequest request) {
		return "usercenter/usercenter";
	}

	/**
	 * 进入书架
	 */
	@RequestMapping(value = "bookshelf", method = RequestMethod.GET)
	public String bookShelfIndex(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// 查询该读者目录下的所有目录
		Reader reader = (Reader) request.getSession().getAttribute("reader");// 首先看是否登录了
		if (reader == null ) {
			try {
				response.sendRedirect("/novelsite/indexview/index");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else {//作者登录了
			
			// 分页处理
			int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
			if (pageNum == -1) {
				pageNum = 1;
			}
			List<BookShelf> allBookShelfs = bookShelfService
					.queryBookShelfsByReaderId(reader.getReaderId());
			int totalRecord = allBookShelfs.size();
			int pageSize = 5;// 每页显示几条
			int startIndex = (pageNum - 1) * pageSize;
			int toIndex = startIndex + pageSize;
			if (startIndex + pageSize >= totalRecord) {
				toIndex = totalRecord;
			}
			PageBean<BookShelf> bookShelfPageBean = new PageBean<>(pageNum, pageSize,
					totalRecord);
			if (pageNum > bookShelfPageBean.getTotalPage()) {
				pageNum = bookShelfPageBean.getTotalPage();
			}

			List<BookShelf> bookShelfs = bookShelfService.queryBookShelfsByPage(
					reader.getReaderId(), startIndex, toIndex);
			
			bookShelfPageBean.setList(bookShelfs);
			request.setAttribute("bookShelfPageBean", bookShelfPageBean);
			return "bookshelf/bookshelf";
		}
		return null;
		
	}

}
