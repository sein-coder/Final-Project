package com.kh.letEatGo.festival.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.festival.model.vo.Festival;

public interface FestivalDao {
	
	int insertFestival(SqlSessionTemplate session,Festival festival);

	List<Festival> selectFestival(SqlSessionTemplate session);

	Festival selectFestivalOne(SqlSessionTemplate session, int festival_No);

	int deleteFestival(SqlSessionTemplate session, int festival_No);

	int updateFestival(SqlSessionTemplate session, Festival festival);
}
