package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Book;

public interface LocalBookService {
	/**
	 * 增加书籍
	 * @param book
	 */
	public void insertBook(Book book);
	
	/**
	 * 查询书籍
	 * @param bookCodition  条件
	 */
	public List<Book> queryBookByCondition(@Param("bookCodition") Book bookCodition);
	
	/**
	 * 查询书籍 根据名字
	 */
	public Book queryBookByName(@Param("bookName") String bookName);
	/**
	 * 删除书籍 status 置为 -1
	 */
	public int updateBook(Book book); 
	/**
	 * 根据书名 或作者名字 模糊查询
	 */
	public List<Book> queryLikeBook(@Param("name") String name);
	/**
	 * 查询书籍 根据id
	 */
	public Book queryBookById(@Param("bookName") Long bookId);
}
