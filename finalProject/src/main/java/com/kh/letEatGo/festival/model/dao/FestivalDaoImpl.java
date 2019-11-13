package com.kh.letEatGo.festival.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.festival.model.vo.Festival;

@Repository
public class FestivalDaoImpl implements FestivalDao {

	@Override
	public int insertFestival(SqlSessionTemplate session, Festival festival) {
		return session.insert("festival.insertFestival",festival);
	}

	@Override
	public List<Festival> selectFestival(SqlSessionTemplate session) {
		return session.selectList("festival.selectFestival");
	}
	
	@Override
	public Festival selectFestivalOne(SqlSessionTemplate session, int festival_No) {
		return session.selectOne("festival.selectFestivalOne",festival_No);
	}
	
	@Override
	public int deleteFestival(SqlSessionTemplate session,int festival_No) {
		return session.delete("festival.deleteFestival", festival_No);
	}

	@Override
	public int updateFormFestival(SqlSessionTemplate session, Festival festival) {
		return session.update("festival.updateFormFestival", festival);
	}
	
	
	

	
}
