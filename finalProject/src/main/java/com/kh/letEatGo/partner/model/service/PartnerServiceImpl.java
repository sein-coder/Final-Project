package com.kh.letEatGo.partner.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.letEatGo.partner.model.dao.PartnerDao;
import com.kh.letEatGo.partner.model.vo.Partner;
@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	PartnerDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	
	@Override
	public Partner selectIdAndEmail(Partner p) {
		return dao.selectIdAndEmail(session,p);
	}



	@Override
	public int insertPartner(Partner p) {
		
		return dao.insertPartner(session,p);
	}



	@Override
	public Partner selectPartnerOne(Partner p) {
		return dao.selectPartnerOne(session,p);
	}



	@Override
	public int updatePartnerPage(Partner p) {
		return dao.updatePartnerPage(session,p);
	}



	@Override
	public Partner selectPartnerNo(Partner p) {
		return dao.selectPartnerNo(session,p);
	}



	@Override
	public int deletePartnerPage(Partner p) {
		 return dao.deletePartnerPage(session,p);
	}



	@Override
	public Partner selectPartnerEmail(Partner p) {
		// TODO Auto-generated method stub
		return dao.selectPartnerEmail(session,p);
	}

	@Override
	public int updatePartnerPassword(Partner p) {
		// TODO Auto-generated method stub
		return dao.updatePartnerPassword(session,p);
	}



	@Override
	public List<Partner> selectPartnerList() {
		// TODO Auto-generated method stub
		return dao.selectPartnerList(session);
	}
	
	
}
