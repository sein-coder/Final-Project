package com.kh.letEatGo.partner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.partner.model.vo.Partner;

public interface PartnerDao {

	int insertPartner(SqlSessionTemplate session, Partner p);

	Partner selectPartnerOne(SqlSessionTemplate session, Partner p);

}
