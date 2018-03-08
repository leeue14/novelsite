package com.leeue.novel.entity;

/**
 * 书籍章节实体类 功能:
 * 
 * @author:李月
 * @Version:
 * @Date 2018年1月16日 下午12:35:39
 */
public class Chapter {
	private Long chapterId;// 章节id
	private Long chapterNum;// 章节号
	private String chapterName;// 章节名称
	private String uploadTime;// 上传时间
	private Long bookId;// 书号
	private String body;// 章节内容
	private int worldCount;// 字数
	private int isVip;// 是否是vip章节
	private int status;// 是否发布 0 表示没有发布，在草稿箱中

	public Long getChapterId() {
		return chapterId;
	}

	public void setChapterId(Long chapterId) {
		this.chapterId = chapterId;
	}

	public Long getChapterNum() {
		return chapterNum;
	}

	public void setChapterNum(Long chapterNum) {
		this.chapterNum = chapterNum;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getWorldCount() {
		return worldCount;
	}

	public void setWorldCount(int worldCount) {
		this.worldCount = worldCount;
	}

	public int getIsVip() {
		return isVip;
	}

	public void setIsVip(int isVip) {
		this.isVip = isVip;
	}

}
