package com.kh.letEatGo.partner.model.service;

import java.util.List;

import com.kh.letEatGo.partner.model.vo.Partner;


public interface PartnerService {

	int insertPartner(Partner p);
	
	Partner selectPartnerOne(Partner p);
	
	int updatePartnerPage(Partner p);

	Partner selectPartnerNo(Partner p);

	 int deletePartnerPage(Partner p);

	Partner selectPartnerEmail(Partner p);

	int updatePartnerPassword(Partner p);

	List<Partner> selectPartnerList();
}
