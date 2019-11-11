package com.kh.letEatGo.mainPage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.mainPage.model.dao.MainPageDao;
import com.kh.letEatGo.mainPage.model.vo.MainPage_Data;

@Service
public class MainPageServiceImpl implements MainPageService{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	MainPageDao dao;

	@Override
	public List<MainPage_Data> selectDataList(String keyword) {
		// TODO Auto-generated method stub
		return dao.selectDataList(session, keyword);
	}

	
}
