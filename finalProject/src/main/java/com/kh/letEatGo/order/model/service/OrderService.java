package com.kh.letEatGo.order.model.service;

import java.util.List;

import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.partner.model.vo.Partner;

public interface OrderService {

	int selectCount();
	List<Partner> selectTruckList(int cPage, int numPerPage);
	List<Menu> selectMenu(int partner_no);
	double selectStar(int partner_no);
	int selectReviewCount(int partner_no);
}
