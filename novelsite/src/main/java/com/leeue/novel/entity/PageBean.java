package com.leeue.novel.entity;

import java.util.List;

/**
 * 这个是分页实体
 * 功能:
 * @author:李月
 * @param <T>
 * @Version:
 * @Date 2018年2月24日 下午8:51:50
 */
public class PageBean<T> {
	private int totalRecord;//总记录数
	private int totalPage;//总页数
	private int pageSize;//每页显示的条数
	private int pageNum;//当前为第几页
	private int startIndex;//查询从第几条开始
	private int start;//起始页
	private int end;//末页
	private List<T> list;//每一页需要放的list放进来
	public PageBean(int pageNum,int pageSize,int totalRecord) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		
		//获取总页数
		if(totalRecord % pageSize == 0){
			this.totalPage = totalRecord / pageSize;
		}else{
			//不能整除要加1
			this.totalPage = totalRecord/pageSize + 1;
		}
		
		//开始索引
		this.startIndex = (pageNum-1) * pageSize;
		this.start = 1;
		this.end = 5;//总共在页面显示5页
		if(totalPage <= 5){
			//如果总页数少于5页
			this.end = this.totalPage;
		}else {
			//如果总页数大于5页要判断当前是在第几页
			this.start = pageNum - 2;
			this.end = pageNum + 2;
			
			if(start <= 0){
				this.start = 1;
				this.end = 5;
			}
			if(end > this.totalPage){
				this.end = totalPage;
				this.start = end - 5;
			}
		}
		
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
	
}
