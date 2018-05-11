package com.leeue.novel.web.chapter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leeue.novel.entity.Book;
import com.leeue.novel.entity.Category;
import com.leeue.novel.entity.Chapter;
import com.leeue.novel.service.CategoryService;
import com.leeue.novel.service.ChapterService;
import com.leeue.novel.service.LocalBookService;
import com.leeue.novel.utils.Constants;
import com.leeue.novel.utils.HttpServletRequestUtil;

@Controller
@RequestMapping("/chapter")
public class ChapterViewController {
	@Autowired
	LocalBookService bookService;
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ChapterService chapterService;
	
	@RequestMapping(value="chapterwrite",method=RequestMethod.GET)
	public String authorWriter(Model model,HttpServletRequest request){
		return "chapterwrite/chapterwrite";
	}
	
//	草稿箱
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String chapterEdit(Model model,HttpServletRequest request){
		long bookId = HttpServletRequestUtil.getLong(request, "bookId");
		Book setBook = bookService.queryBookById(bookId);
		request.getSession().setAttribute("setBook", setBook);
		//查找所有没有被发布的章节 0表示没有被发布
		List<Chapter> chapters = chapterService.findAllChapters(bookId,Constants.IS_NO_PUBLISTH);
		
		Integer editCount = chapterService.findAllChaptersCount(bookId,Constants.IS_NO_PUBLISTH);//查找总章节数，草稿
		/*if(editCount == null){
			editCount = 0;
		}*/
		if(chapters.isEmpty()){
			request.getSession().setAttribute("editCount", editCount);
			request.getSession().removeAttribute("chapters");
			request.getSession().removeAttribute("chapter");
			return "chapterwrite/edit/edit";
		}
		//查找最新一章的内容
		Chapter lastUpdateChapter = chapters.get(0);
		request.getSession().setAttribute("chapters", chapters);
		request.getSession().setAttribute("editCount", editCount);
		request.getSession().setAttribute("chapter", lastUpdateChapter);
		return "chapterwrite/edit/edit";
	}
//	作品设置
	@RequestMapping(value="/novelset",method=RequestMethod.GET)
	public String chapterNovelset(Model model,HttpServletRequest request){
		String bookName = HttpServletRequestUtil.getString(request, "bookName");
		Book setBook = bookService.queryBookByName(bookName);
		Category category = categoryService.queryOneCategory(setBook.getCategoryId());
		Category categoryParent = categoryService.queryOneCategory(category.getParentId());
		request.getSession().setAttribute("category",category);
		request.getSession().setAttribute("categoryParent",categoryParent);
		System.out.println("status"+setBook.getStatus());
		request.getSession().setAttribute("setBook", setBook);
		return "chapterwrite/novelset/novelset";
	}
//	已发布章节
	@RequestMapping(value="/release",method=RequestMethod.GET)
	public String chapterRelease(Model model,HttpServletRequest request){
		long bookId = HttpServletRequestUtil.getLong(request, "bookId");
		//查找所有没有被发布的章节 0表示没有被发布
		List<Chapter> chapters = chapterService.findAllChapters(bookId,Constants.IS_PUBLISH);
		System.out.println(chapters);
		int editCount = chapterService.findAllChaptersCount(bookId,Constants.IS_PUBLISH);//查找总章节数，草稿
		request.getSession().setAttribute("editCount", editCount);
		if(chapters.isEmpty()){
			request.getSession().removeAttribute("chapters");
			request.getSession().removeAttribute("chapter");
			return "chapterwrite/release/release";
		}
	
		//将这本小说加入到session中去
		Book setBook = bookService.queryBookById(bookId);
		request.getSession().setAttribute("setBook", setBook);
		//查找最新一章的内容
		Chapter lastUpdateChapter = chapters.get(0);
		request.getSession().setAttribute("chapters", chapters);
		request.getSession().setAttribute("chapter", lastUpdateChapter);
		return "chapterwrite/release/release";
	}
}
