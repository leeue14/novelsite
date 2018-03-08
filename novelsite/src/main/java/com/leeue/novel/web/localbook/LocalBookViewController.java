package com.leeue.novel.web.localbook;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.entity.Book;
import com.leeue.novel.entity.Chapter;
import com.leeue.novel.entity.Comment;
import com.leeue.novel.entity.PageBean;
import com.leeue.novel.service.ChapterService;
import com.leeue.novel.service.CommentService;
import com.leeue.novel.service.LocalBookService;
import com.leeue.novel.utils.Constants;
import com.leeue.novel.utils.HttpServletRequestUtil;

/**
 * 读者端操作书籍
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月4日 下午3:49:08
 */

@Controller
@RequestMapping(value="/localbook")
public class LocalBookViewController {
	
	
	//读者端查看操作书籍
	@Autowired
	LocalBookService localBookService;
	@Autowired
	ChapterService chapterService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/querybook")
	public String queryBook(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Long bookId = HttpServletRequestUtil.getLong(request, "bookid");
		//因为commntService里面的bookId是字符串，所以这里要转换成字符串才行
		String bookIdStr = bookId.toString();
		//分页处理
		int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
		if(pageNum == -1){
			pageNum =1;
		}
		int totalRecord = commentService.queryAllCommentByBookId(bookIdStr);
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
		List<Comment> comments = commentService.queryComment(bookIdStr,startIndex,toIndex);
		commentPageBean.setList(comments);
		//把获取到的分页放到request
		request.setAttribute("commentPageBean", commentPageBean);
		System.out.println(bookId);
		Book book = localBookService.queryBookById(bookId);
		//查询所有被发布章节
		List<Chapter> chapters = chapterService.findAllChapters(bookId, Constants.IS_PUBLISH);
		System.out.println("chapters--------"+chapters.size());
		if(chapters.size() == 0){
			
			Chapter lastUpdateChapter = new Chapter();
			lastUpdateChapter.setChapterName("没有发布章节");
			lastUpdateChapter.setBody("此书没有发布章节");
			request.setAttribute("lastupdatechapter", lastUpdateChapter);
			request.getSession().setAttribute("localbook", book);//获取书籍的基本信息
			return "localbook/bookmain/bookmain";
		}
		//把最后一章提取出来
		Chapter lastUpdateChapter = chapters.get(0);
		request.setAttribute("vEnter","\n");
		request.setAttribute("lastupdatechapter", lastUpdateChapter);
		request.getSession().setAttribute("localbook", book);//获取书籍的基本信息
		request.getSession().setAttribute("chaptersCount", chapters.size());
		request.getSession().setAttribute("chapters", chapters);
		return "localbook/bookmain/bookmain";
	}
	//进入书籍目录
	@RequestMapping(value="/querycatalog")
	public String queryCatalog(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Long bookId = HttpServletRequestUtil.getLong(request, "bookid");
		//查询所有被发布章节
		List<Chapter> chapters = chapterService.findAllChapters(bookId, Constants.IS_PUBLISH);
		Collections.reverse(chapters);
		//所有章节放去request
		request.setAttribute("chapters", chapters);
		request.getSession().setAttribute("chaptersCount", chapters.size());
		request.setAttribute("bookId", bookId);
		return "localbook/bookcatalog/bookcatalog";
	}
	/**
	 * 查看某一章内容
	 */
	@RequestMapping(value="/querybookdetail")
	public String queryBookDetail(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Long chapterId = HttpServletRequestUtil.getLong(request, "chapterId");
		Long bookId = HttpServletRequestUtil.getLong(request, "bookid");
		System.out.println(bookId);
		Book book = localBookService.queryBookById(bookId);
		request.getSession().setAttribute("localbook", book);//获取书籍的基本信息
		//查询所有被发布章节
		Chapter chapter = chapterService.findChapter(chapterId);
		if(chapter == null){
			chapter = new Chapter();
			chapter.setChapterName("章节还未发布");
			chapter.setBody("章节还未发布");
		}
		//所有章节放去request
		request.setAttribute("chapter", chapter);
		request.setAttribute("vEnter","\n");
		return "localbook/bookreading/bookreading";
	}
	
	
	/**
	 * 查询所有的
	 */
	
	@RequestMapping(value="/querychapters")
	@ResponseBody
	public Map<String, Object>  queryChapters(HttpServletRequest request,HttpServletResponse response){
		/*Long bookId = HttpServletRequestUtil.getLong(request, "bookid");*/

		Map<String, Object> modelMap = new HashMap<String, Object>();
		Book book = (Book) request.getSession().getAttribute("localbook");
		if (book != null) {
			//查询所有被发布章节
			List<Chapter> chapters = chapterService.findAllChapters(book.getBookId(), Constants.IS_PUBLISH);
			Collections.reverse(chapters);
			//所有章节放去request
			modelMap.put("chapters", chapters);
			modelMap.put("success", true);
		}else{
			modelMap.put("errMsg", "书籍查询错误");
			modelMap.put("success", false);
		}

		return modelMap;
	}
	
}
