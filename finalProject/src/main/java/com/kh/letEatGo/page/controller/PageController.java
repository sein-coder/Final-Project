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
	
	@RequestMapping("/list.list")
	public ModelAndView list() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mypage/list");
		return mv;
	}
	
	@RequestMapping("/partnerlist")
	public ModelAndView partnerlist() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mypage/partnerListPage");
		return mv;
				
	}
	@RequestMapping("/memberlist")
	public ModelAndView memberlist() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("mypage/memberListPage");
		return mv;
				
	}
	
	

}
