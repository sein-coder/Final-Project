package com.kh.letEatGo.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.order.model.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;
	
	@Autowired
	SqlSessionTemplate session;
}
