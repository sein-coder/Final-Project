package com.kh.letEatGo.festival.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Festival> selectFestival(SqlSessionTemplate session,int cPage, int numPerPage) {
		RowBounds r = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("festival.selectFestival", null , r);
	}
	
	 @Override
	public List<Festival> selectLikeCount(SqlSessionTemplate session, Festival festival) {
		return session.selectList("festival.selectLikeCount",festival);
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

	@Override
	public int updateFestivalLike(SqlSessionTemplate session, Festival festival) {
		return session.update("festival.updateFestivalLike",festival);
	}
	
	@Override
	public int selectFestivalCount(SqlSessionTemplate session) {
		return session.selectOne("festival.selectFestivalCount");
	}
 
	@Override
	public List<Festival> selectSearchFestival(SqlSessionTemplate session, String searchKeyword, int cPage, int numPerPage) {
		RowBounds r = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("festival.selectSearchFestival", searchKeyword,r);
	}

	@Override
	public int selectSearchTotal(SqlSessionTemplate session, String searchKeyword) {
		return session.selectOne("festival.selectSearchTotal",searchKeyword);
	}

	
	
}
