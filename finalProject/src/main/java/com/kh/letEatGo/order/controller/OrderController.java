package com.kh.letEatGo.order.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.common.page.PageFactory;
import com.kh.letEatGo.order.model.service.OrderService;
import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.partner.model.vo.Partner;

@Controller
public class OrderController {

	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/order")
	public ModelAndView order(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage = 5;
		
		int totalCount = service.selectCount();
		
		List<Menu> menuList = null;
				
		List<Partner> list = service.selectTruckList(cPage, numPerPage);
		System.out.println(list);
		for(Partner p : list) {
			menuList = service.selectMenu(p.getPartner_No());
			p.setStarCount(0);
			p.setReviewCount(0);
			p.setStarCount(service.selectStar(p.getPartner_No()));
			p.setReviewCount(service.selectReviewCount(p.getPartner_No()));
			System.out.println(p.getStarCount());
			System.out.println(p.getReviewCount());
		}
		
		mv.addObject("list", list);
		mv.addObject("menuList", menuList);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageBar", PageFactory.getPageBar(totalCount, cPage, numPerPage, "/letEatGo/order/orderList"));
		mv.setViewName("order/orderList");
		logger.debug(""+list);
		return mv;
	}
	
	@RequestMapping("/order/orderListView")
	public String orderList() {
		
		return "order/orderListView";
	}
	
	@RequestMapping("/order/payment")
	public String payment() {
		return "order/payment";
	}
	

}
