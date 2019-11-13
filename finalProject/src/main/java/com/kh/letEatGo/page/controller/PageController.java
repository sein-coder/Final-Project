package com.kh.letEatGo.page.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.member.model.service.MemberService;
import com.kh.letEatGo.member.model.vo.Member;
import com.kh.letEatGo.partner.model.service.PartnerService;
import com.kh.letEatGo.partner.model.vo.Partner;

@SessionAttributes(value= {"loginMember","msg"}) //여기들어가는 값은 배열로 받을 수 있음 키값이 들어감
@Controller
public class PageController {
	
	@Autowired
	MemberService member_service;
	@Autowired
	PartnerService partner_service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;  //암호화 스프링에 bean으로 등록해야함
	@Autowired
	private MyEncrypt enc;
	
	@RequestMapping("/memberPage")
	public String memberPage(Member m,Model model) {
		Member result=member_service.selectMemberOne(m);
		model.addAttribute("member",result);
		
		
		return "mypage/memberPage";
	}
	
	@RequestMapping("/partnerPage")
	public String partnerPage(Partner p,Model model) {
		Partner result2=partner_service.selectPartnerOne(p);
		model.addAttribute("partner",result2);
		
		return "mypage/partnerPage";
	}
	
	@RequestMapping("/adminPage")
	public String adminPage() {
		return "mypage/adminPage";
	}
	
	@RequestMapping("/member/updateMember") //멤버 회원 정보 수정
	public String updateMemberPage(Member m,Model model) {
		
		m.setMember_Password(pwEncoder.encode(m.getMember_Password()));
		int result=0;
		//전화번호,이메일 암호화
		try {
			m.setMember_Phone(enc.encrypt(m.getMember_Phone()));
			m.setMember_Email(enc.encrypt(m.getMember_Email()));
			result=member_service.updateMemberPage(m);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		String msg="";
		String loc="/";
		if(result>0) {
			msg="정보 수정 성공";
		}else {
			msg="정보 수정 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
		
	}
	
//	 @RequestMapping("/member/deleteMember") //멤버 회원 탈퇴
//	  public String deleteMemberPage(Member m,HttpSession session,Model model) {
//		 
//		    int result=member_service.deleteMemberPage(m);
//		 
//		    String msg="";
//			String loc="/";
//			if(result>0) {
//				msg="회원 탈퇴 성공";
//				session.invalidate();
//			}else {
//				msg="회원 탈퇴 실패";
//			}
//			model.addAttribute("msg",msg);
//			model.addAttribute("loc",loc);
//			
//			
//			
//			return "common/msg";	  
//			}
//	 
	 @RequestMapping("/partner/updatePartner") //멤버 회원 정보 수정
		public String updatePartnerPage(Partner p,Model model) {
			
			p.setPartner_Password(pwEncoder.encode(p.getPartner_Password()));
			int result=0;
			//전화번호, 이메일 암호화
			try {
				p.setPartner_Phone(enc.encrypt(p.getPartner_Phone()));
				p.setPartner_Email(enc.encrypt(p.getPartner_Email()));
				result=partner_service.updatePartnerPage(p);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			
			String msg="";
			String loc="/";
			if(result>0) {
				msg="정보 수정 성공";
			}else {
				msg="정보 수정 실패";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
			
			return "common/msg";
			
		}
	 
	 @RequestMapping("/deleteMember")
	 public String deleteMember() {
		 return "mypage/deleteMember";
	 }
	 
	 @RequestMapping("/deleteMemberPage")
	 public String deleteMemberPage() {
		 
		 return "";
		 
	 }
	  
	

	

}
