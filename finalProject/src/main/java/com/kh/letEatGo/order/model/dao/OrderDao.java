package com.kh.letEatGo.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.order.model.vo.Order;
import com.kh.letEatGo.order.model.vo.Review;
import com.kh.letEatGo.order.model.vo.ReviewComment;
import com.kh.letEatGo.partner.model.vo.Partner;

public interface OrderDao {

	int selectCount(SqlSessionTemplate session);
	List<Partner> selectTruckList(SqlSessionTemplate session, int cPage, int numPerPage);
	List<Menu> selectMenu(SqlSessionTemplate session, int partner_No);
	double selectStar(SqlSessionTemplate session, int partner_No);
	int selectReviewCount(SqlSessionTemplate session, int partner_No);
	Partner selectTruck(SqlSessionTemplate session, int partner_No);
	List<Review> selectReview(SqlSessionTemplate session, int partner_No);
	int insertOrder(SqlSessionTemplate session, Order order);
	List<ReviewComment> selectReviewComment(SqlSessionTemplate session, int comment_To);
}
