package com.kh.letEatGo.map.model.service;

import java.util.List;

import com.kh.letEatGo.map.model.vo.Map;
import com.kh.letEatGo.map.model.vo.PartnerCategory;

public interface MapService {
	List<PartnerCategory> categoryList();
	List<Map> selectMapList();
}
