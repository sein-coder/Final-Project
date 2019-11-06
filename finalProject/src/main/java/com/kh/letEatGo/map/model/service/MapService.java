package com.kh.letEatGo.map.model.service;

import java.util.List;

import com.kh.letEatGo.map.model.vo.ZoneMap;
import com.kh.letEatGo.map.model.vo.TruckMap;

public interface MapService {
	List<TruckMap> categoryList();
	List<ZoneMap> selectMapList();
}
