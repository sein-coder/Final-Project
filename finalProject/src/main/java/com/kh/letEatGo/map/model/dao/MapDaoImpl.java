package com.kh.letEatGo.map.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.map.model.vo.Map;
import com.kh.letEatGo.map.model.vo.PartnerCategory;

@Repository
public class MapDaoImpl implements MapDao {

	@Override
	public List<PartnerCategory> categoryList(SqlSessionTemplate session) {
		return session.selectList("map.selectList");
	}

	@Override
	public List<Map> selectMapList(SqlSessionTemplate session) {
		return session.selectList("map.selectMapList");
	}
	
}
