package com.kh.letEatGo.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public int insertCalendar(SqlSessionTemplate session, Calendar c) {
		return session.insert("calendar.insertCalendar",c);
	}

	@Override
	public Calendar selectCalendarOne(SqlSessionTemplate session, Calendar c) {
		return session.selectOne("calendar.selectCalendarOne",c);
	}

	@Override
	public List<Calendar> selectCalendar(SqlSessionTemplate session, String partnerno) {
		return session.selectList("calendar.selectCalendar", partnerno);
	}
	
	
	
	
	
	

}
