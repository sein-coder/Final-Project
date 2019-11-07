package com.kh.letEatGo.order.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.partner.model.vo.Partner;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public int selectCount(SqlSessionTemplate session) {
		int count = session.selectOne("order.selectCount");
		return count;
	}

	@Override
	public List<Partner> selectTruckList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Partner> list = session.selectList("order.selectTruckList", null, rb);
		return list;
	}

	
}
