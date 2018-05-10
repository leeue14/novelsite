package com.leeue.novel.web.admin.usermanage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leeue.novel.entity.Admin;
import com.leeue.novel.entity.PageBean;
import com.leeue.novel.entity.Reader;
import com.leeue.novel.service.ReaderService;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.RegexUtil;
@Controller
@RequestMapping(value="usermanage")
public class UsermanageViewControl {
	
	/**
	 * 进入用户管理中心
	 */
	@Autowired
	ReaderService readerService;
	@RequestMapping(value="usermanageindex")
	public String usermanageIndex(HttpServletRequest request,HttpServletResponse response){
		List<Reader> readers = readerService.queryAllReader(null);
		System.out.println(readers);
		
		int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
		String name = HttpServletRequestUtil.getString(request,"name");
		Reader readerCondition = new Reader();
		if(name != null){
			
			readerCondition.setNickName(name);
			readerCondition.setEmail(name);
		}
		System.out.println("name"+name);
		System.out.println("pageNum"+pageNum);
		if(pageNum == -1){
			pageNum = 1;
		}
		int pageSize = 5;
		int totalRecord = readers.size();
		int startIndex = (pageNum-1) * pageSize;
		int toIndex = startIndex+pageSize;
		if(startIndex+pageSize > totalRecord){
			toIndex = totalRecord;
		}
		PageBean<Reader> readerPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
		List<Reader> pageReaders = readerService.queryReaderByPage(startIndex, toIndex,readerCondition);
		readerPageBean.setList(pageReaders);
		request.setAttribute("readerPageBean", readerPageBean);
		request.setAttribute("link", "/novelsite/usermanage/usermanageindex?");
		return "admin/usermanage/usermanage";
	}
	
	@RequestMapping(value="usermanagesearch")
	public String usermanageSearch(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
		String name = HttpServletRequestUtil.getString(request,"name");
		Reader readerCondition = new Reader();
		if(name != null){
			
			readerCondition.setNickName(name);
			readerCondition.setEmail(name);
		}
		List<Reader> readers = readerService.queryAllReader(readerCondition);
		
		System.out.println("name"+name);
		System.out.println("pageNum"+pageNum);
		if(pageNum == -1){
			pageNum = 1;
		}
		int pageSize = 5;
		int totalRecord = readers.size();
		int startIndex = (pageNum-1) * pageSize;
		int toIndex = startIndex+pageSize;
		if(startIndex+pageSize > totalRecord){
			toIndex = totalRecord;
		}
		PageBean<Reader> readerPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
		List<Reader> pageReaders = readerService.queryReaderByPage(startIndex, toIndex,readerCondition);
		readerPageBean.setList(pageReaders);
		request.setAttribute("readerPageBean", readerPageBean);
		request.setAttribute("link", "/novelsite/usermanage/usermanagesearch?name="+name+"&");
		return "admin/usermanage/usermanage";
	}
	
	
	@RequestMapping(value="userdelete")
	public String userdelete(HttpServletRequest request,HttpServletResponse response){
		//删除
		long readerId = HttpServletRequestUtil.getLong(request, "readerId");
		int status  = HttpServletRequestUtil.getInt(request, "status");
		
		if(readerId != -1){
			Reader reader = new Reader();
			reader.setStatus(status);
			reader.setReaderId(readerId);
			readerService.updateReader(reader);
		}
		List<Reader> readers = readerService.queryAllReader(null);
		System.out.println(readers);
		
		int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
		String name = HttpServletRequestUtil.getString(request,"name");
		Reader readerCondition = new Reader();
		if(name != null){
			
			readerCondition.setNickName(name);
			readerCondition.setEmail(name);
		}
		System.out.println("name"+name);
		System.out.println("status"+status);
		if(pageNum == -1){
			pageNum = 1;
		}
		int pageSize = 5;
		int totalRecord = readers.size();
		int startIndex = (pageNum-1) * pageSize;
		int toIndex = startIndex+pageSize;
		if(startIndex+pageSize > totalRecord){
			toIndex = totalRecord;
		}
		PageBean<Reader> readerPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
		List<Reader> pageReaders = readerService.queryReaderByPage(startIndex, toIndex,readerCondition);
		readerPageBean.setList(pageReaders);
		request.setAttribute("readerPageBean", readerPageBean);
		request.setAttribute("link", "/novelsite/usermanage/usermanageindex?");
		return "admin/usermanage/usermanage";
	}
	
}
