package com.kh.letEatGo.partner.model.service;

import com.kh.letEatGo.partner.model.vo.Partner;


public interface PartnerService {

	int insertPartner(Partner p);
	
	Partner selectPartnerOne(Partner p);

}
