package com.kh.letEatGo.accountBook.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.accountBook.model.vo.Account;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;

public interface AccountBookDao {
	int selectAccountBookCount(SqlSessionTemplate session, int partner_No);
	
	List<AccountBook> selectAccountBookList(SqlSessionTemplate session, int partner_No, int cPage, int numPerPage);
	
	List<AccountBook> selectAllAccountBookList(SqlSessionTemplate session, int partner_No);
	
	int insertAccountBook(SqlSessionTemplate session, AccountBook ab);
	
	int deleteAccountBook(SqlSessionTemplate session, int account_No);
	
	int updateAccountBook(SqlSessionTemplate session, AccountBook ab);
	
	AccountBook selectAccountBook(SqlSessionTemplate session, AccountBook ab);
	
	Account selectAccount(SqlSessionTemplate session, int partner_No);
	
	int insertAccount(SqlSessionTemplate session, Account account);

	List<Map<String,String>> selectCalRate(SqlSessionTemplate session, int partner_No);
	
	int selectMonthlyIncome(SqlSessionTemplate session, int partner_No);

	List<Map<String,String>> selectYesterday_today_incomeRate(SqlSessionTemplate session, int partner_No);

	int selectSumRevenue(SqlSessionTemplate session, int partner_No);
	
	double selectGoalMonthly(SqlSessionTemplate session, int partner_No);
	
	List<Map<String,String>> selectCalRoundChart(SqlSessionTemplate session, int partner_No);
	
	int updateAccount(SqlSessionTemplate session, Map<String,Integer> map);
	
	Map<String,Integer> selectSumInOutcome(SqlSessionTemplate session, int partner_No);
	
	
}
