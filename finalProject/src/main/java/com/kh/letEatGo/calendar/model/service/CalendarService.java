package com.kh.letEatGo.calendar.model.service;

import java.util.List;

import com.kh.letEatGo.calendar.model.vo.Calendar;

public interface CalendarService {
	
	int insertCalendar(Calendar c);
	
	Calendar selectCalendarOne(Calendar c);
	
	List<Calendar> selectCalendar(String partnerno);

}
