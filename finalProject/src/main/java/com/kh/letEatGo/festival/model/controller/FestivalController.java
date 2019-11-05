package com.kh.letEatGo.festival.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FestivalController {
	
	@RequestMapping("/festivalView")
	public ModelAndView FestivalForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("festival/festivalView");
		return mv;
	}


}