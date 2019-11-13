package com.kh.letEatGo.festival.model.controller;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.festival.model.service.FestivalService;
import com.kh.letEatGo.festival.model.vo.Festival;


@Controller
public class FestivalController {
	
	@Autowired
	private FestivalService service;
	
	@RequestMapping("/festival/festivalList")
	public ModelAndView selectfestival() {
		ModelAndView mv=new ModelAndView();
	
		List<Festival> list=service.selectFestival();
		
		mv.addObject("list",list);
		mv.setViewName("festival/festivalList");
		return mv;
	}
	
	@RequestMapping("/festival/festivalForm")
	public ModelAndView festivalForm() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("festival/festivalForm");
		return mv;
	}
	
	@RequestMapping("/festival/festivalFormEnd.do")
	public ModelAndView insertFestival(Festival festival) {
		ModelAndView mv=new ModelAndView();		
		int result=service.insertFestival(festival);
		
		String msg="";
		String loc="/festival/festivalList";
		
		if(result>0) {
			msg="축제 등록을 성공하셨습니다.";
		}else {
			msg="축제 등록을 실패하셨습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/festival/festivalView")
	public ModelAndView selectFestivalOne(int festival_No) {
		ModelAndView mv=new ModelAndView();
		Festival festival=service.selectFestivalOne(festival_No);
		mv.addObject("festival",festival);
		mv.setViewName("festival/festivalView");
		
		System.out.println(mv);
		
		return mv;
	}
	
	@RequestMapping("/festival/deleteFestival")
	public ModelAndView deleteFestival(int festival_No) {
		
		ModelAndView mv=new ModelAndView();
		int result=service.deleteFestival(festival_No);
		
		String msg="";
		String loc="/festival/festivalList";
		
		if(result>0) {
			msg="삭제를 성공하였습니다.";
		}else {
			msg="삭제를 실패하였습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
}