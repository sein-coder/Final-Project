package com.kh.letEatGo.page.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/memberPage")
	public String memberPage(Member m,Model model) {
		Member result=member_service.selectMember(m);
		model.addAttribute("member",result);
		
		
		return "mypage/memberPage";
	}
	
	@RequestMapping("/partnerPage")
	public String partnerPage(Partner p,Model model) {
		Partner result2=partner_service.selectPartnerOne(p);
		model.addAttribute("partner",result2);
		
		
		return "mypage/partnerPage";
	}
	
	@RequestMapping("/pageList")
	public String pageList() {
		return "mypage/list";
	}
	
	@RequestMapping("/adminPage")
	public String adminPage() {
		return "mypage/adminPage";
	}
	
	@RequestMapping("/member/updateMember") //멤버 회원 정보 수정
	public String updateMemberPage(Member m,Model model) {
		int result=member_service.updateMemberPage(m);
		
		System.out.println(result);
		
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
	
	 @RequestMapping("/member/deleteMember") //멤버 회원 탈퇴
	  public String deleteMember(Member m,Model model) {
		 int result=member_service.deleteMember(m);
		    String msg="";
			String loc="/";
			if(result>0) {
				msg="회원 탈퇴 성공";
			}else {
				msg="회원 탈퇴 실패";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
			
			return "common/msg";
	  }
	  
	

	

}
