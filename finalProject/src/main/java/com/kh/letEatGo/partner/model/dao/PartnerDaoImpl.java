package com.kh.letEatGo.partner.model.dao;

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
		// TODO Auto-generated method stub
		return session.selectOne("partner.selectPartner",p);
	}	
}
