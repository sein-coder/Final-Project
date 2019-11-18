package com.kh.letEatGo.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.calendar.model.vo.Calendar;

public interface CalendarDao {
   
   int insertCalendar(SqlSessionTemplate session,Calendar c);
   
   Calendar selectCalendarOne(SqlSessionTemplate session,Calendar c);
   
   List<Calendar> selectCalendar(SqlSessionTemplate session,String partnerno);

}