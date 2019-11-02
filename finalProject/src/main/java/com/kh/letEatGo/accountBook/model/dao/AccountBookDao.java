package com.kh.letEatGo.accountBook.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.accountBook.model.vo.AccountBook;

public interface AccountBookDao {
	int selectAccountBookCount(SqlSessionTemplate session, int partner_No);
	
	List<AccountBook> selectAccountBookList(SqlSessionTemplate session, int partner_No, int cPage, int numPerPage);
	
	int insertAccountBook(SqlSessionTemplate session, AccountBook ab);
	
	int deleteAccountBook(SqlSessionTemplate session, int account_No);
	
	int updateAccountBook(SqlSessionTemplate session, AccountBook ab);
}
