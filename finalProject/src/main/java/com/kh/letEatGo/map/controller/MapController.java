package com.kh.letEatGo.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.letEatGo.map.model.service.MapService;
import com.kh.letEatGo.map.model.vo.PartnerCategory;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	
	//화면전환용 method
	@RequestMapping("/map")
	public String map(Model model) {
		List<PartnerCategory> permissionNo=service.selectPermissionNo();
		
		model.addAttribute("list",permissionNo);
		return "map/map";
	}
	
	
	
	//화면전환용 method
		@RequestMapping("/foodTruck")
		public String foodTruck(String foodTruck,Model model) {
			return "";
		}
	
	
	
}
