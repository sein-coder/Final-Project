package com.kh.letEatGo.festival.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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




@Controller
public class FestivalController {
	private Logger logger =LoggerFactory.getLogger(FestivalController.class);
	
	@Autowired
	private FestivalService service;
	
	@RequestMapping("/festival/festivalList")
	//여기 어제걸로 되돌려놓을것@!!!!!!!
	public ModelAndView selectfestival(Festival festival,@RequestParam(value="upFile", required=false) MultipartFile upFile,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
		List<Festival> list = service.selectFestival();
		mv.addObject("list", list);
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
		
		String saveDir = req.getSession().getServletContext()
				.getRealPath("/resources/images/festival");
 		
		
		  File dir=new File(saveDir); if(!dir.exists())
		  logger.debug("폴더생성 "+dir.mkdirs());
		  
		  String[] startdate = festival.getFestival_StartDate().split("-");
		  String[] enddate = festival.getFestival_EndDate().split("-");
		  
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
			   String oriFileName=upFile.getOriginalFilename();			   festival.setFestival_Thumbnail(oriFileName);
		   try { 
			  //transferTo는 multipa 제공 			   upFile.transferTo(new File(saveDir+"/"+oriFileName));
		   
		  }catch(IOException  e) {
			   e.printStackTrace();
			   }
		   }
		  
		  try {
			   service.insertFestival(festival);
		 }catch(Exception e) {
		  logger.debug("에러임");
		 
		}
		
		mv.setViewName("redirect:/festival/festivalList");
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
	public ModelAndView updateFormFestival(Festival festival,@RequestParam(value="upFile", required=false) MultipartFile upFile,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView();
	
		String saveDir = req.getSession().getServletContext()
				.getRealPath("/resources/images/festival"); 		
		
		  File dir=new File(saveDir); if(!dir.exists())
		  logger.debug("폴더생성 "+dir.mkdirs());
		  
		  String[] startdate = festival.getFestival_StartDate().split("-");
		  String[] enddate = festival.getFestival_EndDate().split("-");
		  
		  //날짜비교 로직
		  
		  Calendar nowdate = Calendar.getInstance();
		  
		  Calendar calendar1 = Calendar.getInstance();
		  calendar1.set(Integer.parseInt(startdate[0]), Integer.parseInt(startdate[1])-1, Integer.parseInt(startdate[2]));
		  
		  Calendar calendar2 = Calendar.getInstance();
		  calendar2.set(Integer.parseInt(enddate[0]), Integer.parseInt(enddate[1])-1, Integer.parseInt(enddate[2]));

		  System.out.println(calendar1.getTime());
		  
		  if(nowdate.compareTo(calendar1) >= 0) {
			  if(nowdate.compareTo(calendar2) <= 0) {
				  festival.setFestival_Proceeding("진행");
			  }else {
				  festival.setFestival_Proceeding("종료");
			  }
		  }else {
			  festival.setFestival_Proceeding("예정");
		  }
		  
		  if(upFile!=null && !upFile.isEmpty()) { 
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
			msg="수정을 성공하였습니다.";
		}else {
			msg="수정을 실패하였습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
        
		mv.setViewName("common/msg");
		return mv;
	}
	
//count추가 update문 만들기
}