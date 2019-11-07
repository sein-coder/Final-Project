package com.kh.letEatGo.festival.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.festival.model.vo.Festival;

public interface FestivalDao {
	
	int insertFestival(SqlSessionTemplate session,Festival festival);

	List<Festival> selectFestival(SqlSessionTemplate session);
}
