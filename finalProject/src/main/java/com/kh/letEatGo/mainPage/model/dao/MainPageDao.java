package com.kh.letEatGo.mainPage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.mainPage.model.vo.MainPage_Data;

public interface MainPageDao {
	
	List<MainPage_Data> selectDataList(SqlSessionTemplate session, String keyword);
	
	List<Map<String,String>> selectTypeCount(SqlSessionTemplate session);
}
