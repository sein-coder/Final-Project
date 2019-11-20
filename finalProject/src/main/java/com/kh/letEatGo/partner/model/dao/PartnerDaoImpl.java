package com.kh.letEatGo.partner.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.partner.model.vo.Partner;
@Repository
public class PartnerDaoImpl implements PartnerDao {

	
	
	@Override
	public Partner selectIdAndEmail(SqlSessionTemplate session, Partner p) {
		return session.selectOne("partner.selectPartnerIdAndEmail",p);
	}

	@Override
	public int insertPartner(SqlSessionTemplate session, Partner p) {
		
		return session.insert("partner.insertPartner",p);
	}
	
	@Override
	public Partner selectPartnerOne(SqlSessionTemplate session, Partner p) {
		// TODO Auto-generated method stub
		return session.selectOne("partner.selectPartnerOne",p);

	}

	@Override
	public int updatePartnerPage(SqlSessionTemplate session, Partner p) {
		return session.update("partner.updatePartnerPage",p);
	}

	@Override
	public Partner selectPartnerNo(SqlSessionTemplate session, Partner p) {
	
		return session.selectOne("partner.selectPartnerNo",p);
	}

	@Override
	public int deletePartnerPage(SqlSessionTemplate session, Partner p) {
		return session.delete("partner.deletePartnerPage",p);
	}

	@Override
	public Partner selectPartnerEmail(SqlSessionTemplate session, Partner p) {
		// TODO Auto-generated method stub
		return session.selectOne("partner.selectPartnerEmail",p);
	}

	@Override
	public int updatePartnerPassword(SqlSessionTemplate session, Partner p) {
		// TODO Auto-generated method stub
		return session.update("partner.updatePartnerPassword",p);
	}

	@Override
	public List<Partner> selectPartnerList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("partner.selectPartnerList");
	}	
	
	
}
