package com.kh.letEatGo.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.letEatGo.member.model.service.MemberService;
import com.kh.letEatGo.member.model.vo.Member;

@Controller
public class MemberController {
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	
//	@RequestMapping("/member/memberEnroll.do")
//	public String insertMember(Member m,Model model) {
//		int result=service.insertMember(m);
//		logger.debug(""+result);
//		//msg.jsp이용하여 처리해보자.
//		String msg="";
//		String loc="/";
//		if(result>0) {
//			msg="회원가입완료!";
//		}else {
//			msg="회원가입실패!";
//		}
//		model.addAttribute("msg",msg);
//		model.addAttribute("loc",loc);
//		
//		//가입이 끝나면??? 그냥 view로 연결하면???
//		//return "redirect:/";
//		//redirect방식으로 메인화면으로 이동
//		return "common/msg";
//	}
	
	
}
