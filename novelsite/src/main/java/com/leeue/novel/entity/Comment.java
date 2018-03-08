package com.leeue.novel.entity;

/**
 * 小说评论实体类
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年2月26日 下午3:16:33
 */
public class Comment {
	private Long commentId;//评论id
	private String bookId;//评论的书籍id
	private String bookName;//评论书籍的名字
	private String nickName;//评论人的昵称
	private Long readerId;//评论人的id
	private String body;//评论内容
	private String date;//评论时间
	private Integer goodClick;//点赞
	private String commentTitle;
	
	private Integer priority;//根据跟更新时间
	public Long getCommentId() {
		return commentId;
	}
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Long getReaderId() {
		return readerId;
	}
	public void setReaderId(Long readerId) {
		this.readerId = readerId;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getGoodClick() {
		return goodClick;
	}
	public void setGoodClick(Integer goodClick) {
		this.goodClick = goodClick;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	
	
}
