package com.kh.letEatGo.order.model.service;

import java.util.List;

import com.kh.letEatGo.partner.model.vo.Partner;

public interface OrderService {

	int selectCount();
	List<Partner> selectTruckList(int cPage, int numPerPage);
}
