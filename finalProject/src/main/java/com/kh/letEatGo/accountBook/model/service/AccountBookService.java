package com.kh.letEatGo.accountBook.model.service;

import java.util.List;
import java.util.Map;

import com.kh.letEatGo.accountBook.model.vo.Account;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;

public interface AccountBookService {
	int selectAccountBookCount(int partner_No);
	
	List<AccountBook> selectAccountBookList(int partner_No, int cPage, int numPerPage);
	
	List<AccountBook> selectAllAccountBookList(int partner_No);
	
	int insertAccountBook(AccountBook ab);
	
	int deleteAccountBook(int account_No);
	
	int updateAccountBook(AccountBook ab);
	
	AccountBook selectAccountBook(AccountBook ab);
	
	Account selectAccount(int partner_No);
	
	int insertAccount(Account account);
	
	List<Map<String,String>> selectCalRate(int partner_No);
	
	int selectMonthlyIncome(int partner_No);
	
	List<Map<String,String>> selectYesterday_today_incomeRate(int partner_No);
	
	int selectSumRevenue(int partner_No);

	double selectGoalMonthly(int partner_No);
	
	List<Map<String,String>> selectCalRoundChart(int partner_No);
	
	int updateAccount(Map<String,Integer> map);
	
}
