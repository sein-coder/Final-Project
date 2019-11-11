package com.kh.letEatGo.festival.model.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.festival.model.service.FestivalService;
import com.kh.letEatGo.festival.model.vo.Festival;
import com.kh.spring.board.model.vo.Attachment;



@Controller
public class FestivalController {
	private Logger logger =LoggerFactory.getLogger(FestivalController.class);
	
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
	public ModelAndView insertFestival(Festival festival,@RequestParam(value="upFile", required=false) MultipartFile upFile,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();		
		int result=service.insertFestival(festival);
		
		
		String saveDir = req.getSession().getServletContext()
				.getRealPath("/resources/upload/festival");
		
		File dir=new File(saveDir);
		if(!dir.exists()) logger.debug("폴더생성 "+dir.mkdirs());
		
		for(MultipartFile f:upFile) {
			MultipartFile f=new File
			if(!f.isEmpty()) {
				
				String oriFileName=f.getOriginalFilename();
				
				try {
					//transferTo는 multipart가 제공
					f.transferTo(new File(saveDir+"/"));
				}catch(IOException e) {
					e.printStackTrace();
				}
				Attachment at=new Attachment();
				at.setOriginalFileName(oriFileName);
				list.add(at);
			}
		}
		
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
	public ModelAndView updateFormFestival(Festival festival) {
		ModelAndView mv=new ModelAndView();
		
		System.out.println("festival+mkmjmk박세인멍청"+festival);
		
		
		int result = service.updateFormFestival(festival);
		
		String msg="";
		String loc="/festival/festivalList";
		
		if(result>0) {
			msg="성공";
		}else {
			msg="글 작성자만 수정할 수 있습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
}