package com.kh.letEatGo.calendar.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.calendar.model.service.CalendarService;
import com.kh.letEatGo.calendar.model.vo.Calendar;
import com.kh.letEatGo.partner.model.vo.Partner;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService cService;
	
	@RequestMapping("/calendar")
    public ModelAndView calendar(String partnerno) {
	ModelAndView mv=new ModelAndView();
	List<Calendar> result=cService.selectCalendar(partnerno);
	mv.setViewName("calendar/calendar");
	mv.addObject("partnerno",partnerno);
	mv.addObject("calendar",result);
	return mv;
		}
	@RequestMapping("/calendar/toDo.do")
	public ModelAndView toDoCalendar(String partnerno) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("partnerno",partnerno);
		mv.setViewName("calendar/addTodo");
		return mv;
	}
	@RequestMapping("/schedule.cal")
	@ResponseBody
	public String schedule(@RequestParam Map<String,String> param,Calendar c) {
		int result=cService.insertCalendar(c);
		return String.valueOf(true);
		
	}
	
	@RequestMapping("/calendarPage")
	public String calendarPage(Calendar c,Model model) {
		Calendar result=cService.selectCalendarOne(c);
		model.addAttribute("calendar",result);
		return "calendar/calendar";
	}

}
