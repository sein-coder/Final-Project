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
	public int insertPartner(Partner p) {
		
		return dao.insertPartner(session,p);
	}



	@Override
	public Partner selectPartnerOne(Partner p) {
		return dao.selectPartnerOne(session,p);
	}


	
	
	

}
