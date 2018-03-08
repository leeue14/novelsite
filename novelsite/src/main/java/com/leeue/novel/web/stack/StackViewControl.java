package com.leeue.novel.web.stack;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leeue.novel.entity.Category;
import com.leeue.novel.entity.PageBean;
import com.leeue.novel.service.CategoryService;
import com.leeue.novel.utils.HttpServletRequestUtil;
import com.leeue.novel.utils.NetBookApi;

/**
 * 分类筛选  书库控制
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月26日 下午10:10:41
 */
@Controller
@RequestMapping(value="/stack")
public class StackViewControl {
	
	@Autowired
	CategoryService categoryService;
	/**
	 * 进入书库
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/indexstack")
	public String chooseType(HttpServletRequest request){
	
		try {
			//首先获取主类型
			Long categoryParentId = HttpServletRequestUtil.getLong(request,"categoryParentId");
			if(categoryParentId == -1){
				categoryParentId = 1L;
			}
			//请求主类型
			request.setAttribute("categoryParent", categoryService.queryCategory(null));
			
			//请求到了子类型
			request.setAttribute("category", categoryService.queryCategory(categoryParentId));
			
			//再获取子类型
			request.setAttribute("catagory", NetBookApi.getMinCats(request));
				int pageNum = HttpServletRequestUtil.getInt(request, "pageNum");
				if(pageNum == -1){
					pageNum = 1;
				}
				//类型
				String type = HttpServletRequestUtil.getString(request, "type");
				if(type == null){
					type="hot";
				}
				
				request.setAttribute("type", type);
				//主分类
				String major = HttpServletRequestUtil.getString(request, "major");
				if(major == null){
					Long parentId =  HttpServletRequestUtil.getLong(request, "parentId");
					request.setAttribute("parentId", parentId);//
					if(parentId != -1){
						Category parent = categoryService.queryOneCategory(parentId);
						major = parent.getCategoryName();
					}else{
						major = "玄幻";
					}
				}
				//子分类
				String minor = HttpServletRequestUtil.getString(request, "minor");
				if(minor == null){
					minor = "";
				}
				if(minor.equals("全部")){
					minor = "";
				}
				if(pageNum == -1){
					pageNum = 1;
				}
				int pageSize = 20;
				int startIndex = (pageNum-1) * pageSize;
				if(startIndex > 1000){
					startIndex = 999;
				}
				request.setAttribute("minor", minor);
				
				
				System.out.println(startIndex+"startIndex");
				System.out.println(type+""+major+""+minor+""+startIndex);
				JSONObject indexTypeOne = NetBookApi.getType(request, "male",
						type, major, minor,startIndex, 20);
				int totalRecord = indexTypeOne.getInt("total");//获取总的书籍数
			
				//分页处理
				PageBean<Object> bookPageBean = new PageBean<>(pageNum, pageSize, totalRecord);
				List<Object> netBooks = indexTypeOne.getJSONArray("books");
				bookPageBean.setList(netBooks);
				System.out.println("网络小说数量"+netBooks.size());
				
				request.setAttribute("bookPageBean", bookPageBean);
				//当前选中的主分类
				request.setAttribute("major", major);//主分类
				//当前选中的子分类
				if(minor.equals("")){//判断是不是全部
					minor = "全部";
				}
				
				request.setAttribute("minor", minor);//子分类
				
				request.setAttribute("typeName", major+"-"+minor+"小说推荐");
				request.setAttribute("pageLink", "/novelsite/search/searchindex");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "stack/stack";
	}
}
