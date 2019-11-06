package com.kh.letEatGo.festival.model.service;

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

}
