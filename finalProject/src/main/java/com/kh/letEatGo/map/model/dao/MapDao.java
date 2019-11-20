package com.kh.letEatGo.map.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.map.model.vo.ZoneMap;
import com.kh.letEatGo.partner.model.vo.Partner;
import com.kh.letEatGo.map.model.vo.TruckMap;

public interface MapDao {
	List<TruckMap> categoryList(SqlSessionTemplate session);
	List<ZoneMap> selectMapList(SqlSessionTemplate session);
	List<Partner> selectPartnerList(SqlSessionTemplate session);
}
