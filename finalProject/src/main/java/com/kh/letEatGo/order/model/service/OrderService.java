package com.kh.letEatGo.order.model.service;

import java.util.List;
import java.util.Map;

import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.order.model.vo.Order;
import com.kh.letEatGo.order.model.vo.Review;
import com.kh.letEatGo.order.model.vo.ReviewComment;
import com.kh.letEatGo.partner.model.vo.Partner;

public interface OrderService {

	int selectDefaultCount();
	List<Partner> selectDefaultTruckList(int cPage, int numPerPage);
	int selectCount(Map<String, Object> menu);
	List<Partner> selectTruckList(int cPage, int numPerPage, Map<String, Object> menu);
	List<Menu> selectMenu(int partner_No);
	double selectStar(int partner_No);
	int selectReviewCount(int partner_No);
	Partner selectTruck(int partner_No);
	List<Review> selectReview(int partner_No);
	int insertOrder(Order order);
	List<ReviewComment> selectReviewComment(int comment_To);
	List<Menu> selectMenuList(Menu m);
	List<Partner> selectMenuTruckList(int cPage, int numPerPage, String menu_Name);
	int selectMenuCount(String menu_Name);
	int insertReview(Review review);
}