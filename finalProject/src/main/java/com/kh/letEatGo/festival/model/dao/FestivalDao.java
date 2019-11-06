package com.kh.letEatGo.festival.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.festival.model.vo.Festival;

public interface FestivalDao {
	
	int insertFestival(SqlSessionTemplate session,Festival festival);
}
