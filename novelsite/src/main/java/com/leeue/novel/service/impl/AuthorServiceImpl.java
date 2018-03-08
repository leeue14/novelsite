package com.leeue.novel.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import com.leeue.novel.dao.AuthorDao;
import com.leeue.novel.entity.Author;
import com.leeue.novel.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService{

	@Autowired
	AuthorDao authorDao;
	@Transactional
	public int insertAuthor(Author author) {
		return authorDao.insertAuthor(author);
	}

	@Transactional
	public int updateAuthor(Author author) {
		return authorDao.updateAuthor(author);
	}

	@Override
	public Author queryAuthorPenName(String penName) {
		return authorDao.queryAuthorPenName(penName);
	}

	@Override
	public Author queryAuthor(Long readerId) {
		return authorDao.queryAuthor(readerId);
	}

	@Override
	public Author queryAuthorIdCard(String idCard) {
		return authorDao.queryAuthorIdCard(idCard);
	}

}
