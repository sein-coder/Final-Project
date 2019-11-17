package com.kh.letEatGo.accountBook.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.accountBook.model.dao.AccountBookDao;
import com.kh.letEatGo.accountBook.model.vo.Account;
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

	@Override
	public Account selectAccount(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectAccount(session, partner_No);
	}

	@Override
	public int insertAccount(Account account) {
		// TODO Auto-generated method stub
		return dao.insertAccount(session, account);
	}

	@Override
	public List<Map<String,String>> selectCalRate(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectCalRate(session, partner_No);
	}

	@Override
	public int selectMonthlyIncome(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectMonthlyIncome(session, partner_No);
	}

	@Override
	public List<Map<String, String>> selectYesterday_today_incomeRate(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectYesterday_today_incomeRate(session, partner_No);
	}

	@Override
	public int selectSumRevenue(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectSumRevenue(session, partner_No);
	}

	@Override
	public double selectGoalMonthly(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectGoalMonthly(session, partner_No);
	}

	@Override
	public List<Map<String, String>> selectCalRoundChart(int partner_No) {
		// TODO Auto-generated method stub
		return dao.selectCalRoundChart(session, partner_No);
	}
	
	
	
}
