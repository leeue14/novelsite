package com.leeue.novel.entity;

/**
 * 书架实体类
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月26日 下午3:23:16
 */
public class BookShelf {
	private Long bookShelfId;//书架id
	private String bookId;//书籍id号
	private String site;//书籍来源站
	private String link;//上次读到的那个地方
	private String title;//书架最后读到那个地方的章节名
	private String type;//书籍类别
	private Long readerId;
	private Integer priority;//根据跟更新时间
	private String bookName;
	private String author;
	public Long getBookShelfId() {
		return bookShelfId;
	}
	public void setBookShelfId(Long bookShelfId) {
		this.bookShelfId = bookShelfId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Long getReaderId() {
		return readerId;
	}
	public void setReaderId(Long readerId) {
		this.readerId = readerId;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	
/*	private String bookName;//书籍名称
*/	//跟加入时间排序
	
	
}
