package com.kh.letEatGo.order.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.order.model.dao.OrderDao;
import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.partner.model.vo.Partner;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int selectCount() {
		int count = dao.selectCount(session);
		return count;
	}

	@Override
	public List<Partner> selectTruckList(int cPage, int numPerPage) {
		List<Partner> list = dao.selectTruckList(session, cPage, numPerPage);
		return list;
	}

	@Override
	public List<Menu> selectMenu(int partner_No) {
		List<Menu> menuList = dao.selectMenu(session, partner_No);
		return menuList;
	}

	@Override
	public double selectStar(int partner_No) {
		double starCount = dao.selectStar(session, partner_No);
		return starCount;
	}

	@Override
	public int selectReviewCount(int partner_No) {
		int reviewCount = dao.selectReviewCount(session, partner_No);
		return reviewCount;
	}

}
