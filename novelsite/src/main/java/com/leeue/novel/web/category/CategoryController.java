package com.leeue.novel.web.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.dao.CategoryDao;
import com.leeue.novel.entity.Category;
import com.leeue.novel.service.CategoryService;
import com.leeue.novel.utils.HttpServletRequestUtil;

/**
 * 作品标签
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月6日 下午7:12:39
 */
@Controller
@RequestMapping(value="/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 获取分类列表
	 * @return
	 */
	@RequestMapping(value="getparentcategorylist",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getParentCategoryList(HttpServletRequest request,HttpServletResponse responses){
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Long parentId = HttpServletRequestUtil.getLong(request, "categoryParentId");
		System.out.println("-----"+parentId);
		List<Category> categorieParents = categoryService.queryCategory(null);
		List<Category> categories = null;
		request.getSession().setAttribute("categorieParents", categorieParents);
		if(parentId > 0){
			categories = categoryService.queryCategory(parentId);
			request.getSession().setAttribute("categories", categories);
		}else {
			//查询了
			categories = categoryService.queryCategory(1L);
			request.getSession().setAttribute("categories", categories);
		}
		
		modelMap.put("categorieParents", categorieParents);
		modelMap.put("categories", categories);
		modelMap.put("success", true);
		return modelMap;
	}
	

}
