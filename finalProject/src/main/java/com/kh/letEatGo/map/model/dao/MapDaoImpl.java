package com.kh.letEatGo.map.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.map.model.vo.ZoneMap;
import com.kh.letEatGo.map.model.vo.TruckMap;

@Repository
public class MapDaoImpl implements MapDao {

	@Override
	public List<TruckMap> categoryList(SqlSessionTemplate session) {
		return session.selectList("map.selectList");
	}

	@Override
	public List<ZoneMap> selectMapList(SqlSessionTemplate session) {
		return session.selectList("map.selectMapList");
	}
	
}
