package com.leeue.novel.entity;

import java.util.Date;

/**
 * 小说实体类
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月16日 上午12:42:11
 */
public class Book {
	
	private Long bookId;
	private String name;
	private Long authorId;
	private String authorName;
	private Long categoryId;
	private int recommendTicket;//推荐票
	private int clickCount;//点击
	private int collectCount;//收藏
	private int wordsNum;//总字数
	private Date updateTime;//更新时间
	private int monthClick;
	private int weekClick;
	private String cover;//封面
	private String cat;//标签
	private String shortInfo;//简介
	private int status;//状态
	private Date createTime;
	private int isVip;//是否是vip书籍
	private String  site;
	
	private Integer priority;//根据跟更新时间
	
	
//	get 和 set方法
	public Long getBookId() {
		return bookId;
	}
	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public int getRecommendTicket() {
		return recommendTicket;
	}
	public void setRecommendTicket(int recommendTicket) {
		this.recommendTicket = recommendTicket;
	}
	public int getClickCount() {
		return clickCount;
	}
	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}
	
	public int getCollectCount() {
		return collectCount;
	}
	public void setCollectCount(int collectCount) {
		this.collectCount = collectCount;
	}
	public int getWordsNum() {
		return wordsNum;
	}
	public void setWordsNum(int wordsNum) {
		this.wordsNum = wordsNum;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public int getMonthClick() {
		return monthClick;
	}
	public void setMonthClick(int monthClick) {
		this.monthClick = monthClick;
	}
	public int getWeekClick() {
		return weekClick;
	}
	public void setWeekClick(int weekClick) {
		this.weekClick = weekClick;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getShortInfo() {
		return shortInfo;
	}
	public void setShortInfo(String shortInfo) {
		this.shortInfo = shortInfo;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getIsVip() {
		return isVip;
	}
	public void setIsVip(int isVip) {
		this.isVip = isVip;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	
	

}
