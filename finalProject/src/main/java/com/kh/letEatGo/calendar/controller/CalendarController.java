package com.kh.letEatGo.calendar.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar")
    public ModelAndView calendar() {
	ModelAndView mv=new ModelAndView();
	mv.setViewName("calendar/calendar");
	return mv;
		}
	@RequestMapping("/calendar/toDo.do")
	public String toDoCalendar() {
		return "calendar/addTodo";
	}
	@RequestMapping("/schedule.cal")
	@ResponseBody
	public String schedule(@RequestParam Map<String,String> param) {
		System.out.println(param);
		
		return String.valueOf(true);
		
	}

}
