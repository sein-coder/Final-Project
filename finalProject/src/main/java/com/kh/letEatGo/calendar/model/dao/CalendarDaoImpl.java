package com.kh.letEatGo.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public int insertCalendar(SqlSessionTemplate session, Calendar c) {
		return session.insert("calendar.insertCalendar",c);
	}
	
	

}
