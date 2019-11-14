package com.kh.letEatGo.festival.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.festival.model.dao.FestivalDao;
import com.kh.letEatGo.festival.model.vo.Festival;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private FestivalDao dao;
	
	@Override
	public int insertFestival(Festival festival) {
		int result=0;
		result=dao.insertFestival(session,festival);
		return result;
	}

	@Override
	public List<Festival> selectFestival() {
		
		return dao.selectFestival(session);
	}

	@Override
	public Festival selectFestivalOne(int festival_No) {
		return dao.selectFestivalOne(session,festival_No);
	}
	
	@Override
	public int deleteFestival(int festival_No) {
		int result=0;
		result=dao.deleteFestival(session, festival_No);
		return result;
	}

	@Override
	public int updateFormFestival(Festival festival) {
		int result=0;
		result=dao.updateFormFestival(session, festival);
		return result;
	}

	@Override
	public int updateFestivalLike(Festival festival) {
		int result=0;
		result=dao.updateFestivalLike(session,festival);
		return result;
	}

	
	

}
