package com.kh.letEatGo.calendar.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.calendar.model.service.CalendarService;
import com.kh.letEatGo.calendar.model.vo.Calendar;

@Controller
public class CalendarController {
   
   @Autowired
   CalendarService cService;
   
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
   public String schedule(@RequestParam Map<String,String> param,Calendar c) {
      System.out.println(param);
      
      int result=cService.insertCalendar(c);
      
      
      
      
      
      return String.valueOf(true);
      
   }

}
