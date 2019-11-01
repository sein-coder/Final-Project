package com.kh.letEatGo.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar")
    public ModelAndView calendar() {
	ModelAndView mv=new ModelAndView();
	mv.setViewName("calendar/calendar");
	return mv;
		}

}
