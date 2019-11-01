package com.kh.letEatGo.accountBook.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountBookDaoImpl implements AccountBookDao {
	
	@Autowired
	private AccountBookDao dao;
	@Autowired
	private SqlSessionTemplate session;
}
