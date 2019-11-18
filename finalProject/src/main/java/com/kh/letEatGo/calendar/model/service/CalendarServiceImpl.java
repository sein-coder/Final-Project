package com.kh.letEatGo.calendar.model.service;

import java.util.List;

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

	   @Override
	   public Calendar selectCalendarOne(Calendar c) {
	      return dao.selectCalendarOne(session,c);
	   }

	   @Override
	   public List<Calendar> selectCalendar(String partnerno) {
	      return dao.selectCalendar(session, partnerno);
	   }


}
