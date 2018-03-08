package com.leeue.novel.entity;

import java.io.Serializable;

/**
 * 小说类型
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月16日 上午12:40:22
 */
public class Category implements Serializable{
	private Long categoryId;
	private String categoryName;//类型名称
	private Long parentId;
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	
	
}
