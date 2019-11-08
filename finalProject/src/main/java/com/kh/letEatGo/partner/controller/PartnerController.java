package com.kh.letEatGo.partner.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.partner.controller.PartnerController;
import com.kh.letEatGo.partner.model.service.PartnerService;
import com.kh.letEatGo.partner.model.vo.Partner;

@Controller
public class PartnerController {
	private Logger logger=LoggerFactory.getLogger(PartnerController.class);
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private MyEncrypt enc;
	@Autowired
	PartnerService service;
	
	@RequestMapping("/partner/partnerEnrollEnd")
	public String partnerEnroll() {
		return "partner/partnerEnroll";
	}
	@RequestMapping("/partner/partnerEnrollEnd.do")
	public String insertPartner(Partner p,Model model) {
		  System.out.println(p);
		  p.setPartner_Password(pwEncoder.encode(p.getPartner_Password()));
			logger.debug(p.getPartner_Password());
			//전화번호, 주소, 이메일 암호화
			try {
//				p.setPartner_Phone(enc.encrypt(p.getPartner_Phone()));
				p.setPartner_Email(enc.encrypt(p.getPartner_Email()));
				p.setPartner_Address(enc.encrypt(p.getPartner_Address()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		int result=service.insertPartner(p);
		String msg="";
	 	String loc="/";
	 if(result>0) {
		 msg="회원가입완료!";
	 }else {
		 msg="회원가입실패!"; 
	  } 
	 	model.addAttribute("msg",msg);
	 	model.addAttribute("loc",loc);
  
	 return "common/msg";
//		return "partner/partnerEnroll";
	}
	  @RequestMapping("/partner/updatePartner") //파트너 회원 정보 수정
	  public String updateMember(Partner p,Model model) {
		  System.out.println("수정");
		  
		  return "";
	  }
	  @RequestMapping("/partner/deletePartner") //파트너 회원 탈퇴
	  public String deleteMember(Partner p,Model model) {
		  System.out.println("삭제");
		  
		  return "";
	  }
	
}
