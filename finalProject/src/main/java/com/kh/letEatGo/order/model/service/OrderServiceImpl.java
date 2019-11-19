package com.kh.letEatGo.order.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.order.model.dao.OrderDao;
import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.order.model.vo.Order;
import com.kh.letEatGo.order.model.vo.Review;
import com.kh.letEatGo.order.model.vo.ReviewComment;
import com.kh.letEatGo.partner.model.vo.Partner;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int selectDefaultCount() {
		int totalCount = dao.selectDefaultCount(session);
		return totalCount;
	}

	@Override
	public List<Partner> selectDefaultTruckList(int cPage, int numPerPage) {
		List<Partner> list = dao.selectDefaultTruckList(session, cPage, numPerPage);
		return list;
	}

	@Override
	public int selectCount(Map<String, Object> menu) {
		int count = dao.selectCount(session, menu);
		return count;
	}

	@Override
	public List<Partner> selectTruckList(int cPage, int numPerPage, Map<String, Object> menu) {
		List<Partner> list = dao.selectTruckList(session, cPage, numPerPage, menu);
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
	
	@Override
	public Partner selectTruck(int partner_No) {
		Partner result = dao.selectTruck(session, partner_No);
		return result;
	}

	@Override
	public List<Review> selectReview(int partner_No) {
		List<Review> list = dao.selectReview(session, partner_No);
		return list;
	}

	@Override
	public int insertOrder(Order order) {
		int result = dao.insertOrder(session, order);
		return result;
	}

	@Override
	public List<ReviewComment> selectReviewComment(int comment_To) {
		List<ReviewComment> list = dao.selectReviewComment(session, comment_To);
		return list;
	}

	@Override
	public List<Menu> selectMenuList(Menu m) {
		List<Menu> menuList = dao.selectMenuList(session, m);
		return menuList;
	}

	@Override
	public List<Partner> selectMenuTruckList(int cPage, int numPerPage, String menu_Name) {
		List<Partner> list = dao.selectMenuTruckList(session, cPage, numPerPage, menu_Name);
		return list;
	}

	@Override
	public int selectMenuCount(String menu_Name) {
		int result = dao.selectMenuCount(session, menu_Name);
		return result;
	}
}