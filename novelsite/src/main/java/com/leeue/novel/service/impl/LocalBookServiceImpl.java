package com.leeue.novel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leeue.novel.dao.LocalBookDao;
import com.leeue.novel.entity.Book;
import com.leeue.novel.service.LocalBookService;


@Service
public class LocalBookServiceImpl implements LocalBookService{

	@Autowired
	LocalBookDao localBookDao;
	@Transactional
	public void insertBook(Book book) {
		localBookDao.insertBook(book);
	}

	@Override
	public List<Book> queryBookByCondition(Book bookCodition) {
		return localBookDao.queryBookByCondition(bookCodition);
	}

	@Override
	public Book queryBookByName(String bookName) {
		return localBookDao.queryBookByName(bookName);
	}

	@Transactional
	public int updateBook(Book book) {
		return localBookDao.updateBook(book);
	}

	@Override
	public List<Book> queryLikeBook(String name) {
		
		return localBookDao.queryLikeBook(name);
	}

	@Override
	public Book queryBookById(Long bookId) {
		
		return localBookDao.queryBookById(bookId);
	}

}
