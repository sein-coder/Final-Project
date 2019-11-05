package com.kh.letEatGo.map.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.map.model.vo.Map;
import com.kh.letEatGo.map.model.vo.PartnerCategory;

public interface MapDao {
	List<PartnerCategory> categoryList(SqlSessionTemplate session);
	List<Map> selectMapList(SqlSessionTemplate session);
}
