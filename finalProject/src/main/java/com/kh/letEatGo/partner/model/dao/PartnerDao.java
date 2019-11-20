package com.kh.letEatGo.partner.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.partner.model.vo.Partner;

public interface PartnerDao {

	int insertPartner(SqlSessionTemplate session, Partner p);
	
	Partner selectPartnerOne(SqlSessionTemplate session,Partner p);
	
	Partner selectIdAndEmail(SqlSessionTemplate session,Partner p);
	
	int updatePartnerPage(SqlSessionTemplate session,Partner p);

	Partner selectPartnerNo(SqlSessionTemplate session, Partner p);
	
	 int deletePartnerPage(SqlSessionTemplate session,Partner p);

	Partner selectPartnerEmail(SqlSessionTemplate session, Partner p);

	int updatePartnerPassword(SqlSessionTemplate session, Partner p);

	List<Partner> selectPartnerList(SqlSessionTemplate session);

}
