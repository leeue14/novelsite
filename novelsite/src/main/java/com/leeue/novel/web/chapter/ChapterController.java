package com.leeue.novel.web.chapter;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.leeue.novel.entity.Book;
import com.leeue.novel.entity.Chapter;
import com.leeue.novel.service.ChapterService;
import com.leeue.novel.utils.DateFormat;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.StringUtis;

/**
 * 
 * 功能: 这个是对本地章节的增删查改
 * 
 * @author:李月
 * @Version:
 * @Date 2018年2月3日 下午4:35:54
 */
@Controller
@RequestMapping("/chapteroperation")
public class ChapterController {

	@Autowired
	ChapterService chapterService;

	/**
	 * 获取点击的li 章节内容
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getlastchapter", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getLastChapter(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Long chapterId = HttpServletRequestUtil.getLong(request, "chapterId");
		if (chapterId == -1) {
			String divDate = "<input id='chapterTitleInput' name='chaptertitle' type='text'  "
					+ "placeholder='此处输入章节号与章节名。示例：“第十章 天降奇缘”'"
					+ "style='color: rgb(51, 51, 51);' />"
					+ "<textarea name='content' id='chapterContentInput'"
					+ "placeholder='请输入正文。请注意：根据国家相关法律法规要求，请勿上传任何色情、低俗、涉政等违法违规内容，我们将会根据法规进行审核处理和上报。'"
					+ " style='color: rgb(51, 51, 51);'></textarea>";
			modelMap.put("divDate", divDate);
			modelMap.put("success", true);
			return modelMap;
		}
		Chapter chapter = chapterService.findChapter(chapterId);
		System.out.println("我被点击了，在获取章节");
		System.out.println("我是vip章节吗"+chapter.getIsVip());
		String divDate = "<input id='chapterTitleInput' name='chaptertitle' type='text'  "
				+ "placeholder='此处输入章节号与章节名。示例：“第十章 天降奇缘”'"
				+ "value="
				+ StringUtis.getHtmlString(chapter.getChapterName())
				+ " "
				+ "style='color: rgb(51, 51, 51);' />"
				+ "<textarea name='content' id='chapterContentInput'"
				+ "placeholder='请输入正文。请注意：根据国家相关法律法规要求，请勿上传任何色情、低俗、涉政等违法违规内容，我们将会根据法规进行审核处理和上报。'"
				+ " style='color: rgb(51, 51, 51);'>"
				+ chapter.getBody()
				+ "</textarea>";
		request.getSession().setAttribute("chapter", chapter);
		modelMap.put("chapter", chapter);
		modelMap.put("divDate", divDate);
		modelMap.put("success", true);
		return modelMap;
	}

	// 插入新章节
	@RequestMapping(value = "/insertchapter", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertChapter(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			String chapterStr = HttpServletRequestUtil.getString(request,
					"chapterStr");
			ObjectMapper mapper = new ObjectMapper();
			Chapter chapter = null;
			chapter = mapper.readValue(chapterStr, Chapter.class);//将前端传入的chapter的json转换成对象
			
			
			Book setBook = (Book) request.getSession().getAttribute("setBook");
			int chapterNum = (int) request.getSession().getAttribute(
					"editCount");
			chapter.setBookId(setBook.getBookId());
			chapter.setStatus(0);
			chapter.setChapterNum(chapterNum + 1L);

			chapter.setUploadTime(DateFormat.FormatDateSupport(new Date()));

			chapterService.insertChapter(chapter);
			modelMap.put("success", true);
			modelMap.put("redirct", true);
			modelMap.put("url", "/novelsite/chapter/edit?bookId="+setBook.getBookId());
			return modelMap;
		}catch (Exception e) {
			modelMap.put("errMsg", e.getMessage());
			modelMap.put("success", false);
			return modelMap;
		}

	}
	
	

	//更新章节
		@RequestMapping(value = "/updatechapter", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> updateChapter(HttpServletRequest request) {
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				String chapterStr = HttpServletRequestUtil.getString(request,
						"chapterStr");
				ObjectMapper mapper = new ObjectMapper();
				Chapter chapter = null;
				chapter = mapper.readValue(chapterStr, Chapter.class);//将前端传入的chapter的json转换成对象
				chapter.setUploadTime(DateFormat.FormatDateSupport(new Date()));
				Book setBook = (Book) request.getSession().getAttribute("setBook");
				chapterService.updateChapter(chapter);
				request.getSession().setAttribute("lastUpdateChapter", chapter);
				modelMap.put("success", true);
				modelMap.put("redirct", true);
				modelMap.put("url", "/novelsite/chapter/edit?bookId="+setBook.getBookId());
				return modelMap;
			}catch (Exception e) {
				modelMap.put("errMsg", e.getMessage());
				modelMap.put("success", false);
				return modelMap;
			}

		}
		
		

		//删除章节
			@RequestMapping(value = "/deletechapter", method = RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> deleteChapter(HttpServletRequest request) {
				Map<String, Object> modelMap = new HashMap<String, Object>();
				try {
					Long chapterId = HttpServletRequestUtil.getLong(request, "chapterId");
				
					
					chapterService.deleteChapter(chapterId);
					modelMap.put("success", true);
					modelMap.put("redirct", true);
					/*modelMap.put("url", "/novelsite/chapter/edit?bookId="+setBook.getBookId());*/
					return modelMap;
				}catch (Exception e) {
					modelMap.put("errMsg", e.getMessage());
					modelMap.put("success", false);
					return modelMap;
				}

			}
		
		

}
