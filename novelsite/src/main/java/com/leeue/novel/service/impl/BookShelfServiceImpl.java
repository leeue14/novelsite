package com.leeue.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leeue.novel.dao.BookShelfDao;
import com.leeue.novel.entity.BookShelf;
import com.leeue.novel.service.BookShelfService;

@Service
public class BookShelfServiceImpl implements BookShelfService{
	@Autowired
	BookShelfDao bookShelfDao;

	@Transactional
	public void insertBookInBookShelf(BookShelf bookShelf) {
		bookShelfDao.insertBookInBookShelf(bookShelf);
	}

	@Override
	public List<BookShelf> queryBookShelfsByReaderId(Long readerId) {
		return bookShelfDao.queryBookShelfsByReaderId(readerId);
	}

	@Transactional
	public void deleteBookShelfById(Long bookShelfId) {
		bookShelfDao.deleteBookShelfById(bookShelfId);
	}

	@Override
	public BookShelf queryBookShelfById(String bookId, Long readerId) {
		return bookShelfDao.queryBookShelfById(bookId, readerId);
	}


	public List<BookShelf> queryBookShelfsByPage(Long readerId, int start,
			int end) {
		return bookShelfDao.queryBookShelfsByPage(readerId, start, end);
	}

	@Override
	public int queryAllBookByReaderId(Long readerId) {
		// TODO Auto-generated method stub
		return bookShelfDao.queryAllBookByReaderId(readerId);
	}

	@Override
	public void updateBookShelfById(BookShelf bookShelf) {
		
		bookShelfDao.updateBookShelfById(bookShelf);
	}

}
