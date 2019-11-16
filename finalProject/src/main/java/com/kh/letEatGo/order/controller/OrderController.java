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
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/order")
	public ModelAndView order(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage,
			@RequestParam(value="keyword", required=false)String keyword) {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> menu = new HashMap();
		List<String> category = new ArrayList();
		String[] str;
		
		if(keyword != null && keyword != "") {
			str = keyword.split("/");
			for(int i = 0; i < str.length; i++) {
				category.add(str[i]);
			}
		}
		
		System.out.println(category);
		
		menu.put("category", category);
		
		int numPerPage = 5;
		
		
		List<List<Menu>> menuList = new ArrayList();
		List<Partner> list = service.selectTruckList(cPage, numPerPage, menu);
		int totalCount = service.selectCount(menu);
		
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
		logger.debug(""+list);
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
	  
	/*
	 * @RequestMapping("/order/searchConsole") public List<Partner> searchConsole(
	 * 
	 * @RequestParam(value="menu_Name", required=false)String menu_Name,
	 * 
	 * @RequestParam(value="partner_Menu", required=false)String partner_Menu ){
	 * List<Partner> list = service.selectTruckList(cPage, numPerPage); return list;
	 * }
	 */
}