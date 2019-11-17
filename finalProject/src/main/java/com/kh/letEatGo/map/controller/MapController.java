package com.kh.letEatGo.map.controller;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.map.model.service.MapService;
import com.kh.letEatGo.map.model.vo.ZoneMap;
import com.kh.letEatGo.partner.model.vo.Partner;
import com.kh.letEatGo.map.model.vo.TruckMap;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private MyEncrypt enc;
	
	@RequestMapping("/map")
	public String map(Model model) {
		List<TruckMap> truckList=service.categoryList();
		List<ZoneMap> zonelist=service.selectMapList();
		List<Partner> partnerlist=service.selectPartnerList();
		
		
		/*
		 * for(Partner p : partnerlist) { try {
		 * p.setPartner_Password(enc.decrypt(p.getPartner_Password())); }catch(Exception
		 * e) { e.printStackTrace(); } }
		 */
		
		model.addAttribute("partnerlist",partnerlist);
		model.addAttribute("trucklist",truckList);
		model.addAttribute("zonelist",zonelist);
		return "map/map";
	}
	
	@RequestMapping("/mapGps")
	public String mapGps(String latitude,String longitude,Model model) {
		List<TruckMap> truckList=service.categoryList();
		List<ZoneMap> zonelist=service.selectMapList();
		model.addAttribute("latitude",latitude);
		model.addAttribute("longitude",longitude);
		model.addAttribute("trucklist",truckList);
		model.addAttribute("zonelist",zonelist);
		return "map/map";
	}
	
	@RequestMapping("/mapSearch")
	public String mapGps(String mapAddress,Model model) {
		List<TruckMap> truckList=service.categoryList();
		List<ZoneMap> zonelist=service.selectMapList();
		model.addAttribute("mapAddress",mapAddress);
		model.addAttribute("trucklist",truckList);
		model.addAttribute("zonelist",zonelist);
		return "map/map";
	}
	
	
		@RequestMapping("/foodTruck")
		public String foodTruck(String foodTruck,Model model) {
			return "";
		}
	
	
	
}
