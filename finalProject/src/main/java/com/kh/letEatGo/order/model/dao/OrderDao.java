package com.kh.letEatGo.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.partner.model.vo.Partner;

public interface OrderDao {

	int selectCount(SqlSessionTemplate session);
	List<Partner> selectTruckList(SqlSessionTemplate session, int cPage, int numPerPage);
	List<Menu> selectMenu(SqlSessionTemplate session, int partner_no);
	double selectStar(SqlSessionTemplate session, int partner_no);
	int selectReviewCount(SqlSessionTemplate session, int partner_no);
}
