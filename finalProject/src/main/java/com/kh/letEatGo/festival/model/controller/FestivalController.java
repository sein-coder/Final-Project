package com.kh.letEatGo.festival.model.controller;


import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	

	@RequestMapping("/festival/updateFestival")
	public ModelAndView updateFestival(int festival_No) {
		ModelAndView mv=new ModelAndView();
		
		Festival festival=service.selectFestivalOne(festival_No);
		
		mv.addObject("festival",festival);
		mv.setViewName("/festival/festivalUpdateForm");
		return mv;
	}
	
	@RequestMapping("/festival/festivalUpdateFormEnd.do")
	public ModelAndView updateFormFestival(Festival festival,@RequestParam(value="upFile", required=false) MultipartFile upFile,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		String saveDir = req.getSession().getServletContext()
				.getRealPath("/resources/images/festival"); 		
		
		  File dir=new File(saveDir); if(!dir.exists())
		  logger.debug("폴더생성 "+dir.mkdirs());
		  
			String[] startdate = "2019-11-15".split("-");
			String[] enddate = "2019-11-21".split("-");
			
			//날짜비교 로직
			
			  Calendar nowdate = Calendar.getInstance();
			  
			  Calendar calendar1 = Calendar.getInstance();
			  calendar1.set(Integer.parseInt(startdate[0]), Integer.parseInt(startdate[1])-1, Integer.parseInt(startdate[2]));
			  
			  Calendar calendar2 = Calendar.getInstance();
			  calendar2.set(Integer.parseInt(enddate[0]), Integer.parseInt(enddate[1])-1, Integer.parseInt(enddate[2]));

			  if(nowdate.compareTo(calendar1) >= 0) {
				  if(nowdate.compareTo(calendar2) <= 0) {
					  festival.setFestival_Proceeding("진행");
				  }else {
					  festival.setFestival_Proceeding("종료");
				  }
			  }else {
				  festival.setFestival_Proceeding("예정");
			  }
		  
		  if(!upFile.isEmpty()) { 
			  String oriFileName=upFile.getOriginalFilename();
			  festival.setFestival_Thumbnail(oriFileName); 
			  try { 
				  //transferTo는 multipart 제공 
				  upFile.transferTo(new File(saveDir+"/"+oriFileName)); 
			  }
			  catch(IOException e) {
				  e.printStackTrace(); 
			  } 
		  }
		  
        int result = service.updateFormFestival(festival); 
		
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