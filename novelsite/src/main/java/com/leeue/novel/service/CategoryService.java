package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Category;

public interface CategoryService {
	/**
	 * 查询所有分类
	 * @param parentId
	 * @return
	 */
	List<Category> queryCategory(@Param("parentId") Long parentId);
	/**
	 * 查询单个分类
	 * @param parentId
	 * @return
	 */
	Category queryOneCategory(@Param("categoryId") Long categoryId);
	
}
