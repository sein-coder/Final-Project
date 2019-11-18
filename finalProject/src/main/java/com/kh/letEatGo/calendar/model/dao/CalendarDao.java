package com.kh.letEatGo.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.calendar.model.vo.Calendar;

public interface CalendarDao {
	
	int insertCalendar(SqlSessionTemplate session,Calendar c);

}
