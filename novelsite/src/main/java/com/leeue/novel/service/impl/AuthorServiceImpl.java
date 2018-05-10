package com.leeue.novel.service.impl;

import java.util.List;

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
	public Author queryAuthorById(Long readerId) {
		return authorDao.queryAuthorById(readerId);
	}

	@Override
	public Author queryAuthorIdCard(String idCard) {
		return authorDao.queryAuthorIdCard(idCard);
	}

	@Override
	public List<Author> queryAllAuthor(Author authorCondition) {
		
		return authorDao.queryAllAuthor(authorCondition);
	}

	@Override
	public List<Author> queryAuthorByPage(int start, int end,
			Author authorCondition) {
		
		return authorDao.queryAuthorByPage(start, end, authorCondition);
	}

}
