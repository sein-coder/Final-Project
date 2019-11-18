package com.kh.letEatGo.calendar.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.calendar.model.dao.CalendarDao;
import com.kh.letEatGo.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	SqlSessionTemplate session;
	@Autowired
	CalendarDao dao;

	@Override
	public int insertCalendar(Calendar c) {
		return dao.insertCalendar(session,c);
	}
	
	

}
