package com.kh.letEatGo.order.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.partner.model.vo.Partner;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public int selectCount(SqlSessionTemplate session) {
		int count = session.selectOne("order.selectCount");
		return count;
	}

	@Override
	public double selectStar(SqlSessionTemplate session, int partner_no) {
		double starCount = session.selectOne("order.selectStar", partner_no);
		return starCount;
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate session, int partner_no) {
		int reviewCount = session.selectOne("order.selectReviewCount", partner_no);
		return reviewCount;
	}

	@Override
	public List<Partner> selectTruckList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Partner> list = session.selectList("order.selectTruckList", null, rb);
		return list;
	}

	@Override
	public List<Menu> selectMenu(SqlSessionTemplate session, int partner_no) {
		List<Menu> menuList = session.selectList("order.selectMenu", partner_no);
		return menuList;
	}

}
