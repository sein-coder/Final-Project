package com.kh.letEatGo.map.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.map.model.dao.MapDao;
import com.kh.letEatGo.map.model.vo.Map;
import com.kh.letEatGo.map.model.vo.PartnerCategory;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	MapDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<PartnerCategory> categoryList() {
		return dao.categoryList(session);
	}

	@Override
	public List<Map> selectMapList() {
		return dao.selectMapList(session);
	}

}
