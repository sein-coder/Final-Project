package com.kh.letEatGo.accountBook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.accountBook.model.service.AccountBookService;

@Controller
public class AccountBookController {
	
	@Autowired
	private AccountBookService service;
	
	@RequestMapping("/accountBookView")
	public ModelAndView accountBookView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accountBook/accountBookView");
		return mv;
	}
	
}
