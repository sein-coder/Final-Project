package com.kh.letEatGo.accountBook.model.service;

import java.util.List;

import com.kh.letEatGo.accountBook.model.vo.AccountBook;

public interface AccountBookService {
	int selectAccountBookCount(int partner_No);
	
	List<AccountBook> selectAccountBookList(int partner_No, int cPage, int numPerPage);
	
	List<AccountBook> selectAllAccountBookList(int partner_No);
	
	int insertAccountBook(AccountBook ab);
	
	int deleteAccountBook(int account_No);
	
	int updateAccountBook(AccountBook ab);
	
	AccountBook selectAccountBook(AccountBook ab);
}
