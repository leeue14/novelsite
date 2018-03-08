package com.leeue.novel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Category;

/**
 * 对分类管理
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月4日 下午3:56:45
 */
public interface CategoryDao {
	/**
	 * 查询分类
	 * @param parentId
	 * @return
	 */
	List<Category> queryCategory(@Param("parentId") Long parentId);
	
	/**
	 * 查询分类
	 * @param parentId
	 * @return
	 */
	Category queryOneCategory(@Param("categoryId") Long categoryId);
}
