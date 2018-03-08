package com.leeue.novel.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.BookShelf;

public interface BookShelfService {
	/**
	 * 书籍加入书架
	 */
	void insertBookInBookShelf(BookShelf bookShelf);
	
	/**
	 * 查询所有改读者下的所有书籍
	 */
	List<BookShelf> queryBookShelfsByReaderId(@Param("readerId")Long readerId);
	/**
	 * 删除书架里的书籍
	 */
	void deleteBookShelfById(@Param("bookShelfId")Long bookShelfId);
	
	/**
	 * 查询书架里面的单个书籍 根据书架id
	 */
	BookShelf queryBookShelfById(@Param("bookId")String bookId,@Param("readerId")Long readerId);
	
	/**
	 * 分页查询书籍
	 */
	List<BookShelf> queryBookShelfsByPage(@Param("readerId") Long readerId,@Param("start") int start,@Param("end") int end);
	
	/**
	 * 查询该读者所有的书架书总数
	 */
	int queryAllBookByReaderId(@Param("readerId") Long readerId);
	
	/**
	 * 更新操作
	 * @param bookId
	 * @param readerId
	 * @return
	 */
	void updateBookShelfById(BookShelf bookShelf);
}
