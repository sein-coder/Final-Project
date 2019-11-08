package com.kh.letEatGo.partner.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.partner.model.vo.Partner;
@Repository
public class PartnerDaoImpl implements PartnerDao {

	@Override
	public int insertPartner(SqlSessionTemplate session, Partner p) {
		
		return session.insert("partner.insertPartner",p);
	}

	@Override
	public Partner selectPartnerOne(SqlSessionTemplate session, Partner p) {
		
		return session.selectOne("partner.selectPartnerOne",p);
	}

	
	

}
