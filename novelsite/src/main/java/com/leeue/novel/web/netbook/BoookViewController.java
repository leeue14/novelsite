package com.leeue.novel.web.netbook;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leeue.novel.entity.Comment;
import com.leeue.novel.entity.PageBean;
import com.leeue.novel.service.CommentService;
import com.leeue.novel.utils.HttpJsonUtil;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.HttpUrl;

@Controller
@RequestMapping(value = "bookview", method = RequestMethod.GET)
public class BoookViewController {

	@Autowired
	private BookController bookController;
	@Autowired
	private CommentService commentService;

	/**
	 * 获取书籍介绍页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/bookmain")
	public String bookMainOperation(Model model, HttpServletRequest request) {
		//获取小说评论
		String bookId = HttpServletRequestUtil.getString(request, "bookid");
		int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
		if(pageNum == -1){
			pageNum =1;
		}
		//分页处理
	/*	int pageNum = 1;*/
		int totalRecord = commentService.queryAllCommentByBookId(bookId);
		int pageSize = 10;//每页显示几条
		int startIndex = (pageNum-1) * pageSize;
		int toIndex = startIndex+pageSize;
		if(startIndex+pageSize >= totalRecord){
			toIndex = totalRecord;
		}
		PageBean<Comment> commentPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
		if(pageNum >commentPageBean.getTotalPage()){
			pageNum = commentPageBean.getTotalPage();
		}
		List<Comment> comments = commentService.queryComment(bookId,startIndex,toIndex);
		commentPageBean.setList(comments);
		//把获取到的分页放到request
		request.setAttribute("commentPageBean", commentPageBean);
		// 获取小说简介
		Map<String, Object> modelMapBookInfo = bookController
				.getBookInfo(request);
		// 将书籍简介存入session里面
		request.getSession().setAttribute("modelmapbookinfo", modelMapBookInfo);

		// 获取小说站点
		HashMap<String, Object> bookSite = (HashMap<String, Object>) bookController
				.getBookSite(request);
		JSONObject site = (JSONObject) bookSite.get("siteinfo");
		// 获取小说来源站的全部站点数据
		@SuppressWarnings("unchecked")
		List<Object> listSite = (List<Object>) site.get("data");
		for (int i = 0; i < listSite.size(); i++) {
			System.out.println("站点" + ((JSONObject) listSite.get(i)));
		}
		if (listSite.size() == 0) {

			model.addAttribute("notread", "此书源已过期,获取失败");
			// 获取小说
			return "bookmain/bookmain";
		}
		String hostId = "";
		if (listSite.size() >= 2) {
			hostId = ((JSONObject) listSite.get(1)).getString("_id");
		} else {
			hostId = ((JSONObject) listSite.get(0)).getString("_id");
			model.addAttribute("notread", "此书源已加密,获取失败");
		}
		// 获取小说源id
		request.setAttribute("hostid", hostId);// 默认选择第2个站点，
		// 将获取到的站点放入session中
		request.getSession().setAttribute("hostid", hostId);
		// 获取小说最新更新的内容
		Map<String, Object> lastchapterinfo = bookController
				.getLastChapterUrl(request);

		// 获取小说最新更新的内容
		Map<String, Object> updateChapterDetail = bookController
				.getChapterDetail(request,
						(String) lastchapterinfo.get("lastchapterlink"));
		System.out.println("updateChapterDetail" + updateChapterDetail);
		model.addAttribute("lastchapterinfo", lastchapterinfo);
		model.addAttribute("vEnter", "\n");
		model.addAttribute("updateChapterDetail", updateChapterDetail);
		// 获取小说
		return "bookmain/bookmain";
	}

	/**
	 * 进入书籍目录页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/bookcatalog")
	public String bookCatalogOperation(Model model, HttpServletRequest request) {
		String hostId = HttpServletRequestUtil.getString(request, "hostId");
		request.setAttribute("hostid", hostId);
		// 将获取到的站点放入
		model.addAttribute("hostid", hostId);
		Map<String, Object> chapters = bookController.getBookCatalog(request);
		request.getSession().setAttribute("chapters", chapters);
		return "bookcatalog/bookcatalog";
	}

	/**
	 * 进入书籍详细信息页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/bookdetail")
	public String bookDetailOperation(Model model, HttpServletRequest request) {
		// 获取小说简介
		/*
		 * Map<String, Object> modelMapBookInfo =
		 * bookController.getBookInfo(request);
		 * model.addAttribute("modelmapbookinfo",modelMapBookInfo);
		 */
		String url = HttpServletRequestUtil.getString(request, "url");
		String title = HttpServletRequestUtil.getString(request, "title");// 当前这个章节的标题
		request.getSession().setAttribute("title", title);
		if (url.contains("book.my716.com")) {
			String bookId = HttpServletRequestUtil.getString(request, "bookId");
			String chapterFile = HttpServletRequestUtil.getString(request,
					"chapterFile");
			url += "&bookId=" + bookId + "&chapterFile=" + chapterFile;
		}
		//因为地址栏地址有的时候会携带许多，对地址栏地址重新拼接
		url = HttpUrl.getAddressUrl(request);
		
		Map<String, Object> chapter = bookController.getChapterDetail(request,
				url);
		if(chapter.get("success").equals("true")){
			model.addAttribute("vEnter", "\n");
			request.getSession().setAttribute("chapter", chapter);
		}else {
			model.addAttribute("vEnter", "\n");
			request.getSession().setAttribute("chapter", chapter);
		}
		
		System.out.println("------chapter" + chapter);
		return "bookreading/bookreading";
	}
}
