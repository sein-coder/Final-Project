package com.kh.letEatGo.map.model.service;

import java.util.List;

import com.kh.letEatGo.map.model.vo.TruckMap;
import com.kh.letEatGo.map.model.vo.ZoneMap;
import com.kh.letEatGo.partner.model.vo.Partner;

public interface MapService {
	List<TruckMap> categoryList();
	List<ZoneMap> selectMapList();
	List<Partner> selectPartnerList();
}
