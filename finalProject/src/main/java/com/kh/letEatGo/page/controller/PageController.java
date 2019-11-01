package com.kh.letEatGo.page.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	@RequestMapping("/memberPage")
	public ModelAndView memberPage() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mypage/memberPage");
		return mv;
	}
	
	@RequestMapping("/partnerPage")
	public ModelAndView partnerPage() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mypage/partnerPage");
		return mv;
	}

}
