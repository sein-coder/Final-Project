package com.kh.letEatGo.festival.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.festival.model.vo.Festival;

public interface FestivalDao {
	
	int insertFestival(SqlSessionTemplate session,Festival festival);

	List<Festival> selectFestival(SqlSessionTemplate session,int cPage, int numPerPage);

	Festival selectFestivalOne(SqlSessionTemplate session, int festival_No);

	int deleteFestival(SqlSessionTemplate session, int festival_No);

	int updateFormFestival(SqlSessionTemplate session,Festival festival);

	int updateFestivalLike(SqlSessionTemplate session,Festival festival);

	List<Festival> selectLikeCount(SqlSessionTemplate session ,Festival festival );

	int selectFestivalCount(SqlSessionTemplate session);
}
