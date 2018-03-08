package com.leeue.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leeue.novel.dao.CategoryDao;
import com.leeue.novel.entity.Category;
import com.leeue.novel.service.CategoryService;
/**
 * 这个是分类service
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月8日 下午2:50:49
 */
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> queryCategory(Long parentId) {
		
		return categoryDao.queryCategory(parentId);
	}

	@Override
	public Category queryOneCategory(Long categoryId) {
		// TODO Auto-generated method stub
		return categoryDao.queryOneCategory(categoryId);
	}

}
