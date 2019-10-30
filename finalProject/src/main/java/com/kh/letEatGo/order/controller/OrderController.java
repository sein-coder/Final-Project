package com.kh.letEatGo.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.letEatGo.order.model.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService service;
	
	//화면전환용 method
	@RequestMapping("/order")
	public String order() {
		return "order/orderList";
	}
	
	@RequestMapping("/order/orderListView")
	public String orderList() {
		return "order/orderListView";
	}
}
