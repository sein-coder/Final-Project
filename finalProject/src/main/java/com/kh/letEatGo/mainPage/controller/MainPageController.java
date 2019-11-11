package com.kh.letEatGo.mainPage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.mainPage.model.service.MainPageService;
import com.kh.letEatGo.mainPage.model.vo.MainPage_Data;

@Controller
public class MainPageController {
	
	@Autowired
	MainPageService service;
	
	@RequestMapping("/loadingMainData.do")
	public ModelAndView loadingMainData() {
		
		ModelAndView mv = new ModelAndView();
		
		List<MainPage_Data> slist = service.selectDataList("S");
		List<MainPage_Data> llist = service.selectDataList("L");
		
		if(slist!=null) {
			
			//데이터 중복제거 초기화
			List<MainPage_Data> fslist = new ArrayList();
			List<MainPage_Data> fllist = new ArrayList();
			for(int i=0; i<3; i++) {
				fslist.add(null);
				fllist.add(null);
			}
			
			//small list 중복제거 후 final small list 셋팅
			for(int i=0; i<fslist.size(); i++) {
				fslist.set(i,( slist.get((int)(Math.random() * slist.size()) + 1)) );
				for(int j=0; j<i; j++) {
					if(fslist.get(j) == fslist.get(i)) {
						i--;
					}
				}
			}
			//long list 중복제거 후 final long list 셋팅
			for(int i=0; i<fllist.size(); i++) {
				fllist.set(i,( llist.get((int)(Math.random() * llist.size()) + 1)) );
				for(int j=0; j<i; j++) {
					if(fllist.get(j) == fllist.get(i)) {
						i--;
					}
				}
			}
			
			System.out.println(fslist);
			System.out.println(fllist);
			
			mv.addObject("fslist",fslist);	
			mv.addObject("fllist",fllist);	
		}	
		mv.setViewName("jsonView");
		
		return mv;
	}
	
}
