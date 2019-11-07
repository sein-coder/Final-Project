package com.kh.letEatGo.accountBook.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.accountBook.model.dao.AccountBookDao;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;

@Service
public class AccountBookServiceImpl implements AccountBookService {
	
	@Autowired
	private AccountBookDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int selectAccountBookCount(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectAccountBookCount(session, partner_No);
	}

	@Override
	public List<AccountBook> selectAccountBookList(int partner_No, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAccountBookList(session, partner_No, cPage, numPerPage);
	}

	@Override
	public List<AccountBook> selectAllAccountBookList(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectAllAccountBookList(session, partner_No);
	}

	@Override
	public int insertAccountBook(AccountBook ab) {
		// TODO Auto-generated method stub
		return dao.insertAccountBook(session, ab);
	}

	@Override
	public int deleteAccountBook(int account_No) {
		// TODO Auto-generated method stub
		return dao.deleteAccountBook(session, account_No);
	}

	@Override
	public int updateAccountBook(AccountBook ab) {
		// TODO Auto-generated method stub
		return dao.updateAccountBook(session, ab);
	}

	@Override
	public AccountBook selectAccountBook(AccountBook ab) {
		// TODO Auto-generated method stub
		return dao.selectAccountBook(session, ab);
	}
	
	
	
}
