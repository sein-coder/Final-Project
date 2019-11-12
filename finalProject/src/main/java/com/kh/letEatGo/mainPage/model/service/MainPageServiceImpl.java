package com.kh.letEatGo.mainPage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.mainPage.model.dao.MainPageDao;
import com.kh.letEatGo.mainPage.model.vo.MainPage_Data;
import com.kh.letEatGo.partner.model.dao.PartnerDao;

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

	@Override
	public List<Map<String,String>> selectTypeCount() {
		// TODO Auto-generated method stub
		return dao.selectTypeCount(session);
	}

	
	
}
