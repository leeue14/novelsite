package com.leeue.novel.web.localbook;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.dao.LocalBookDao;
import com.leeue.novel.entity.Author;
import com.leeue.novel.entity.Book;
import com.leeue.novel.service.LocalBookService;
import com.leeue.novel.utils.FileUtils;
import com.leeue.novel.utils.HttpServletRequestUtil;
/**
 * 
 * 功能:  对本站的书籍进行操作
 * @author:李月
 * @Version:
 * @Date 2018年2月4日 下午3:48:39
 */

@Controller
@RequestMapping(value="/localbookoperation")
public class LocalBookController {
	@Autowired
	private LocalBookService localBookService;
	
	/**
	 * 查询书籍
	 * @return
	 */
	@RequestMapping(value="/querybook")
	@ResponseBody
	public Map<String, Object> queryBook(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Author author = (Author) request.getSession().getAttribute("author");
		Book haveBook = new Book();
		if(author == null){
			modelMap.put("success", false);
			modelMap.put("errMsg", "你还没有登录账号");
			return modelMap;
		}
		haveBook.setAuthorId(author.getAuthorId());
		List<Book> books = localBookService.queryBookByCondition(haveBook);
		modelMap.put("success", true);	
		request.getSession().setAttribute("books", books);
		request.getSession().setAttribute("booksCount", books.size());
		return modelMap;
	}
	@RequestMapping(value="/insertbook")
	@ResponseBody
	public Map<String, Object> insertBook(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Author author = (Author) request.getSession().getAttribute("author");
		/*Book haveBook = new Book();*/
		if(author == null){
			modelMap.put("success", false);
			modelMap.put("errMsg", "你还没有登录账号");
			modelMap.put("redirct", true);
			modelMap.put("url", "/novelsite/indexview/index");
			return modelMap;
		}
		String  bookStr = HttpServletRequestUtil.getString(request,"bookStr");
		ObjectMapper mapper = new ObjectMapper();
		Book book = null;
		try {
			book = mapper.readValue(bookStr, Book.class);
			Book haveBook = localBookService.queryBookByName(book.getName());
			if(haveBook!=null){
				modelMap.put("success", false);
				modelMap.put("errMsg", "该书名已经被注册");
				return modelMap;
			}
			book.setAuthorId(author.getAuthorId());
			book.setCreateTime(new Date());
			book.setAuthorName(author.getPenName());
			book.setSite("novelsite");
			localBookService.insertBook(book);
			Book nowBook =  localBookService.queryBookByName(book.getName());//重新从数据库查出来刚刚插进去的书籍，然后再上传封面
			//获取request里面的文件流
			MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
			MultipartFile coverFile = mRequest.getFile("cover");
			//上传图片
			if(coverFile != null){
				String[] format = (coverFile.getOriginalFilename().toString()).split("\\.");
				//copy图片到服务器
				System.out.println(FileUtils.loadNovelCover(coverFile.getInputStream(), format[1], nowBook));
				nowBook.setCover("/novelCover/date/bookId/"+nowBook.getBookId()+"/"+nowBook.getBookId()+"."+format[1]);
				localBookService.updateBook(nowBook);
			}else {
				nowBook.setCover("/novelCover/date/bookId/nocover/nocover.jpg");
				localBookService.updateBook(nowBook);
			}
			
			/*System.out.println("---"+coverFile.getOriginalFilename());
			String loadFilePath = FileUtils.loadNovelCover(book.getCover(), nowBook);
			System.out.println("-------"+loadFilePath);*/
			modelMap.put("success", true);
			modelMap.put("redirct", true);
			modelMap.put("url", "/novelsite/chapter/chapterwrite");
			return modelMap;
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("success", false);
			modelMap.put("errMsg", ""+e.getMessage());
			return modelMap;
		}
	}
	
	@RequestMapping(value="/updatebook")
	@ResponseBody
	public Map<String, Object> updateBook(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Author author = (Author) request.getSession().getAttribute("author");
		if(author == null){
			modelMap.put("success", false);
			modelMap.put("errMsg", "你还没有登录账号");
			modelMap.put("redirct", true);
			modelMap.put("url", "/novelsite/indexview/index");
			return modelMap;
		}
		String  bookStr = HttpServletRequestUtil.getString(request,"bookStr");
		ObjectMapper mapper = new ObjectMapper();
		Book book = null;
		try {
			book = mapper.readValue(bookStr, Book.class);
			Book haveBook = localBookService.queryBookByName(book.getName());
			if(haveBook!=null && haveBook.getBookId() != book.getBookId()){
				modelMap.put("success", false);
				modelMap.put("errMsg", "该书名已经被注册");
				return modelMap;
			}
			book.setAuthorId(author.getAuthorId());
			localBookService.updateBook(book);
			Book nowBook =  localBookService.queryBookByName(book.getName());//重新从数据库查出来刚刚插进去的书籍，然后再上传封面
			//获取request里面的文件流
			MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
			MultipartFile coverFile = mRequest.getFile("cover");
			//上传图片
			if(coverFile != null){
				String[] format = (coverFile.getOriginalFilename().toString()).split("\\.");
				//copy图片到服务器
				System.out.println(FileUtils.loadNovelCover(coverFile.getInputStream(), format[1], nowBook));
				nowBook.setCover("/novelCover/date/bookId/"+nowBook.getBookId()+"/"+nowBook.getBookId()+"."+format[1]);
				localBookService.updateBook(nowBook);
			}
			/*System.out.println("---"+coverFile.getOriginalFilename());
			String loadFilePath = FileUtils.loadNovelCover(book.getCover(), nowBook);
			System.out.println("-------"+loadFilePath);*/
			modelMap.put("success", true);
			modelMap.put("redirct", true);
			modelMap.put("url", "/novelsite/chapter/novelset?bookName="+book.getName());
			return modelMap;
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("success", false);
			modelMap.put("errMsg", ""+e.getMessage());
			return modelMap;
		}
	
	}
	
	
	
	
	
	
	
}
