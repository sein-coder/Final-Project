package com.kh.letEatGo.festival.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FestivalController {
	
	@RequestMapping("/festival/festivaList")
	public ModelAndView FestivalList() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("festival/festivalList");
		return mv;
	}
	
	@RequestMapping("/festival/festivalForm")
	public ModelAndView insertFestivalForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/festival/festivalForm");
		return mv;
	}
	
	
	
	
}