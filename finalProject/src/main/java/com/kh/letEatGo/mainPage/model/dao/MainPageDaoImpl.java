package com.kh.letEatGo.mainPage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.mainPage.model.vo.MainPage_Data;

@Repository
public class MainPageDaoImpl implements MainPageDao{

	@Override
	public List<MainPage_Data> selectDataList(SqlSessionTemplate session, String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("mainPage.selectDataList",keyword);
	}

	@Override
	public List<Map<String,String>> selectTypeCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("partner.selectTypeCount");
	}
	
	

}
