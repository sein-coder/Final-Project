package com.kh.letEatGo.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.letEatGo.common.page.PageFactory;
import com.kh.letEatGo.order.model.service.OrderService;
import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.order.model.vo.Order;
import com.kh.letEatGo.order.model.vo.Review;
import com.kh.letEatGo.order.model.vo.ReviewComment;
import com.kh.letEatGo.partner.model.vo.Partner;

@Controller
public class OrderController {

	private Logger logger = LoggerFactory.getLogger(OrderController.class);
	private int numPerPage = 5;
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/order")
	public ModelAndView order(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage
			) {
		ModelAndView mv = new ModelAndView();
		
		List<List<Menu>> menuList = new ArrayList();
		
		int totalCount = service.selectDefaultCount();
		List<Partner> list = service.selectDefaultTruckList(cPage, numPerPage);
		
		for(Partner p : list) {
			menuList.add(service.selectMenu(p.getPartner_No()));
			p.setStarCount(service.selectStar(p.getPartner_No()));
			p.setReviewCount(service.selectReviewCount(p.getPartner_No()));
		}
		
		mv.addObject("list", list);
		mv.addObject("menuList", menuList);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageBar", PageFactory.getPageBar(totalCount, cPage, numPerPage, "/letEatGo/order/orderList"));
		mv.setViewName("order/orderList");
		return mv;
	}
	
	@RequestMapping("/order/orderListSearch")
	@ResponseBody
	public ModelAndView orderListSearch(@RequestParam(value="menu_Name", required=false)String menu_Name,
			@RequestParam(value="keyword", required=false)String keyword,
			@RequestParam(value="ordering", required=false)String ordering,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage,
			HttpServletResponse res) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Partner> list = new ArrayList();
		int totalCount = 0;
		List<List<Menu>> menuList = new ArrayList();
		
		if(menu_Name != null && menu_Name != "") {
			// 메뉴검색창 관련 처리 비즈니스 로직
			list = service.selectMenuTruckList(cPage, numPerPage, menu_Name);
			totalCount = service.selectMenuCount(menu_Name);
			
		} else if(keyword != null && keyword != "") {
			// partner_Menu 관련 처리 비즈니스로직
			System.out.println("여긴 태그검색이야 들어오니?");
			Map<String, Object> menu = new HashMap();
			List<String> category = new ArrayList();
			
			String[] str = keyword.split("/");
			for(int i = 0; i < str.length; i++) {
				category.add(str[i]);
			}
			menu.put("category", category);
			totalCount = service.selectCount(menu);
			
			if(ordering != null && ordering != "") {
				menu.put("ordering", ordering);
			}
			
			list = service.selectTruckList(cPage, numPerPage, menu);
			mv.addObject("keyword", keyword);
		} else {
			// 기본 조회 결과 처리 비즈니스 로직
		}
		
		for(Partner p : list) {
			menuList.add(service.selectMenu(p.getPartner_No()));
			p.setStarCount(service.selectStar(p.getPartner_No()));
			p.setReviewCount(service.selectReviewCount(p.getPartner_No()));
		}
		
		res.setContentType("application/json;charset=utf-8");
		
		mv.addObject("pageBar", PageFactory.getPageBar(totalCount, cPage, numPerPage, "/letEatGo/order/orderList"));
		mv.addObject("list", list);
		mv.addObject("menuList", menuList);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("/order/orderList");
		return mv;
	}
	
	@RequestMapping("/order/orderListView")
	public ModelAndView orderList(Partner p) {
		ModelAndView mv = new ModelAndView();

		// 트럭 상세페이지에 필요한 데이터 조회
		Partner result = service.selectTruck(p.getPartner_No());
		result.setStarCount(service.selectStar(p.getPartner_No()));
		result.setReviewCount(service.selectReviewCount(p.getPartner_No()));
		List<Menu> list = service.selectMenu(p.getPartner_No());
		List<Review> reviewList = service.selectReview(p.getPartner_No());
		List<ReviewComment> commentList = service.selectReviewComment(p.getPartner_No());
		
		mv.addObject("comment", commentList);
		mv.addObject("menu", list);
		mv.addObject("partner", result); 
		mv.addObject("reviewList", reviewList);
		
		mv.setViewName("order/orderListView");
		return mv;
	}
	
	@RequestMapping("/order/payment.do")
	public String payment(
			@RequestParam(required=false) int order_Price, Model m) {
		m.addAttribute("order_Price", order_Price);
		return "order/payment";
	}
	
	@RequestMapping("/order/orderEnd") 
	public String orderEnd(Order o, HttpSession session) {
		session.setAttribute("order", o);
		return "redirect:/order/complete";
	}
	
	@RequestMapping("/order/complete")
	public String orderComplete(HttpSession session, Model model) {
		Order order = (Order)session.getAttribute("order");
		int result = service.insertOrder(order);
		
		String msg = "";
		String loc = "/order/orderListView?partner_No="+order.getPartner_No();
		if(result > 0) {
			msg = "결제가 완료 되었습니다.";
		} else {
			msg = "결제 데이터 전송 중 오류 발생 - 관리자에게 문의하세요.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/order/selectMenu")
	@ResponseBody
	public String selectMenu(Menu m, HttpServletResponse res){
		ObjectMapper mapper = new ObjectMapper();
		List<Menu> result = service.selectMenuList(m);
		String jsonStr = "";
		try {
			jsonStr = mapper.writeValueAsString(result);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=utf-8");
		return jsonStr;
	}
}