package com.leeue.novel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.leeue.novel.entity.Author;
import com.leeue.novel.entity.Reader;

/**
 * 读者的增删查改在这里进行
 * 功能:
 * @author:李月
 * @Version:
 * @Date 2018年1月16日 下午1:01:36
 */
public interface ReaderDao {
	/**
	 * 插入新读者
	 * @param reader
	 * @return
	 */
	int insertReader(Reader reader);
	/**
	 * 跟新读者信息
	 * @param reader
	 * @return
	 */
	int updateReader(Reader reader);
	/**
	 * 删除读者 停用 将status置为0
	 * @param reader
	 * @return
	 */
	int deleteReader(@Param("readerId") Long readerId);//停用 某个读者不是删除
	/**
	 * 查找读者
	 * @param emailAndPhone
	 * @return
	 */
	Reader queryReader(@Param("emailAndPhone")String emailAndPhone);//查找
	
	
	/**
	 * 查找所有读者
	 * @return
	 */
	List<Reader> queryAllReader(@Param("readerCondition")Reader reader);
	
	/**
	 * 分页查找
	 */
	List<Reader> queryReaderByPage(@Param("start") int start, @Param("end") int end,@Param("readerCondition") Reader reader);
	
}
