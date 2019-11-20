package com.kh.letEatGo.map.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.map.model.dao.MapDao;
import com.kh.letEatGo.map.model.vo.ZoneMap;
import com.kh.letEatGo.partner.model.vo.Partner;
import com.kh.letEatGo.map.model.vo.TruckMap;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	MapDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<TruckMap> categoryList() {
		return dao.categoryList(session);
	}

	@Override
	public List<ZoneMap> selectMapList() {
		return dao.selectMapList(session);
	}

	@Override
	public List<Partner> selectPartnerList() {
		return dao.selectPartnerList(session);
	}
	
}
