package com.leeue.novel.web.index;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.dao.LocalBookDao;
import com.leeue.novel.dto.BookDTO;
import com.leeue.novel.entity.Book;
import com.leeue.novel.entity.Chapter;
import com.leeue.novel.service.ChapterService;
import com.leeue.novel.service.LocalBookService;
import com.leeue.novel.utils.HttpJsonUtil;
import com.leeue.novel.utils.NetBookApi;

/**
 * 进入首页页面
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月6日 下午3:33:07
 */
@Controller
@RequestMapping(value="/indexview",method=RequestMethod.GET)
public class IndexViewController {
	@Autowired
	private IndexController indexController;
	
	@Autowired
	private LocalBookService localBookService;
	
	@Autowired
	private ChapterService chapterService;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String IndexMain(Model model,HttpServletRequest request){
		model.addAttribute("rankmap",indexController.getIndex(request));
		//获取完结榜  经典推荐栏目
		request.setAttribute("finishRank", NetBookApi.getRank(request, "550b836229cd462830ff4d1d"));
		//获取纵横月票榜
		request.setAttribute("recommend", NetBookApi.getRank(request, "54d430962c12d3740e4a3ed2"));
		//获取百度热搜榜
		request.setAttribute("hotSearch", NetBookApi.getRank(request, "564ef4f985ed965d0280c9c2"));
		
		/**获取最近更新的本站小说**/
		
		List<BookDTO> bookLists = new ArrayList<>();
		
		List<Chapter> chapters = chapterService.findUpdateChapters();
		
		for(int i =0; i < chapters.size(); i++){
			//获取这个章节的书
			Chapter chapter = chapters.get(i);
			Book book = localBookService.queryBookById(chapter.getBookId());
			
			BookDTO bookDTO = new BookDTO();
			bookDTO.setBookId(book.getBookId());
			if(!bookLists.contains(bookDTO)){
				bookDTO.setName(book.getName());
				bookDTO.setAuthorId(book.getAuthorId());
				bookDTO.setAuthorName(book.getAuthorName());
				bookDTO.setCategoryId(book.getCategoryId());
				bookDTO.setChapterId(chapter.getChapterId());
				bookDTO.setChapterNum(chapter.getChapterNum());
				bookDTO.setChapterName(chapter.getChapterName());
				bookDTO.setUploadTime(chapter.getUploadTime());
				bookLists.add(bookDTO);
			}
		}
		request.setAttribute("bookLists", bookLists);
		
		
		
		
		return "index/index";
	}
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String testView(Model model,HttpServletRequest request){
	
/*		return "admin/login/login";*/
		return "admin/index";
	}
	
	

	

}
