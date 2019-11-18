package com.kh.letEatGo.page.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String adminPage(Member m,Model model) {
		Member result3=member_service.selectMemberOne2(m);
		model.addAttribute("member", result3);
		return "mypage/adminPage";
	}
	

	@RequestMapping("/member/updateMember") //멤버 회원 정보 수정
	public String updateMemberPage(Member m,Model model) {
		
		m.setMember_Password(pwEncoder.encode(m.getMember_Password()));
	    
		int result=0;
		
		
		try {
			m.setMember_Email(pwEncoder.encode(m.getMember_Email()));
			m.setMember_Phone(pwEncoder.encode(m.getMember_Phone()));
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
	@RequestMapping("/member/deleteMember")
	public String deleteMember() {
		
		
		return "mypage/deleteMember";
	}
	
	 @RequestMapping("/member/deleteMemberPage") //멤버 회원 탈퇴
	  public String deleteMemberPage(Member m,HttpSession session,Model model) {
		 
		    
			int result=0;
			Member resultMember=member_service.selectMemberOne(m);
			if(pwEncoder.matches(m.getMember_Password(), resultMember.getMember_Password())) {	
				result=member_service.deleteMemberPage(m);
			}
		    String msg="";
			String loc="/";
			if(result>0) {
				msg="회원 탈퇴 성공";
				session.invalidate();
				//회원탈퇴 성공후에도 로그아웃 안되는것 문제
			}else {
				msg="회원 탈퇴 실패";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
			
			
			
			return "common/msg";	  
			}
	 
	 @RequestMapping("/partner/updatePartner") //멤버 회원 정보 수정
		public String updatePartnerPage(Partner p,Model model) {
			
			p.setPartner_Password(pwEncoder.encode(p.getPartner_Password()));
			int result=0;
			
			try {
				p.setPartner_Address(pwEncoder.encode(p.getPartner_Address()));
				p.setPartner_Email(pwEncoder.encode(p.getPartner_Email()));
				p.setPartner_Permission_No(pwEncoder.encode(p.getPartner_Permission_No()));
				p.setPartner_Phone(pwEncoder.encode(p.getPartner_Phone()));
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
	 
	 @RequestMapping("/partner/deletePartner")
		public String deletePartner() {
			
			
			return "mypage/deletePartner";
		}
		
		 @RequestMapping("/partner/deletePartnerPage") //멤버 회원 탈퇴
		  public String deletePartnerPage(Partner p,HttpSession session,Model model) {
			 
			    
				int result=0;
				Partner resultPartner=partner_service.selectPartnerOne(p);
				if(pwEncoder.matches(p.getPartner_Password(), resultPartner.getPartner_Password())) {	
					result=partner_service.deletePartnerPage(p);
				}
			             String msg="";
				String loc="/";
				if(result>0) {
					msg="회원 탈퇴 성공";
					session.invalidate(); 
				}else {
					msg="회원 탈퇴 실패";
				}
				model.addAttribute("msg",msg);
				model.addAttribute("loc",loc);
				
				
				
				return "common/msg";	  
				}
		 
		 @RequestMapping("/member/updateAdmin") //멤버 회원 정보 수정
			public String updateAdminPage(Member m,Model model) {
				
				m.setMember_Password(pwEncoder.encode(m.getMember_Password()));
			    
				int result=0;
				
				
				try {
					m.setMember_Email(pwEncoder.encode(m.getMember_Email()));
					m.setMember_Phone(pwEncoder.encode(m.getMember_Phone()));
					result=member_service.updateAdminPage(m);
					
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
		 
		 
		 
		 
	

}
