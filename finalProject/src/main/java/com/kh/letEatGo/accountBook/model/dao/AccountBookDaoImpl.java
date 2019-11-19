package com.kh.letEatGo.accountBook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.accountBook.model.vo.Account;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;

@Repository
public class AccountBookDaoImpl implements AccountBookDao {
	
	@Override
	public int selectAccountBookCount(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectOne("accountBook.selectAccountBookCount", partner_No);
	}

	@Override
	public List<AccountBook> selectAccountBookList(SqlSessionTemplate session, int partner_No, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds r = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("accountBook.selectAccountBookList", partner_No, r);
	}

	@Override
	public List<AccountBook> selectAllAccountBookList(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectList("accountBook.selectAllAccountBookList", partner_No);
	}

	@Override
	public int insertAccountBook(SqlSessionTemplate session, AccountBook ab) {
		// TODO Auto-generated method stub
		return session.insert("accountBook.insertAccountBook",ab);
	}

	@Override
	public int deleteAccountBook(SqlSessionTemplate session, int account_No) {
		// TODO Auto-generated method stub
		return session.delete("accountBook.deleteAccountBook",account_No);
	}

	@Override
	public int updateAccountBook(SqlSessionTemplate session, AccountBook ab) {
		// TODO Auto-generated method stub
		return session.update("accountBook.updateAccountBook",ab);
	}

	@Override
	public AccountBook selectAccountBook(SqlSessionTemplate session, AccountBook ab) {
		// TODO Auto-generated method stub
		return session.selectOne("accountBook.selectAccountBook",ab);
	}

	@Override
	public Account selectAccount(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectOne("account.selectAccount",partner_No);
	}

	@Override
	public int insertAccount(SqlSessionTemplate session, Account account) {
		// TODO Auto-generated method stub
		return session.insert("account.insertAccount",account);
	}

	@Override
	public List<Map<String,String>> selectCalRate(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectList("accountBook.selectCalRate",partner_No);
	}

	@Override
	public int selectMonthlyIncome(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectOne("accountBook.selectMonthlyIncome",partner_No);
	}

	@Override
	public List<Map<String, String>> selectYesterday_today_incomeRate(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectList("accountBook.selectYesterday_today_incomeRate",partner_No);
	}

	@Override
	public int selectSumRevenue(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectOne("accountBook.selectSumRevenue",partner_No);
	}

	@Override
	public double selectGoalMonthly(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectOne("accountBook.selectGoalMonthly",partner_No);
	}

	@Override
	public List<Map<String, String>> selectCalRoundChart(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectList("accountBook.selectCalRoundChart",partner_No);
	}

	@Override
	public int updateAccount(SqlSessionTemplate session, Map<String,Integer> map) {
		// TODO Auto-generated method stub
		return session.update("account.updateAccount",map);
	}

	@Override
	public Map<String,Integer> selectSumInOutcome(SqlSessionTemplate session, int partner_No) {
		// TODO Auto-generated method stub
		return session.selectOne("accountBook.selectSumInOutcome",partner_No);
	}
	
	
	
}
