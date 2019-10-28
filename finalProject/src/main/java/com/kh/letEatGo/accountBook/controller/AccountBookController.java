package com.kh.letEatGo.accountBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountBookController {
	
	@RequestMapping("/accountBookView")
	public ModelAndView accountBookView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountBook/accountBookView");
		return mv;
	}
	
}
