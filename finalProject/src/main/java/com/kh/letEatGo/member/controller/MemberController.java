package com.kh.letEatGo.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.member.model.service.MemberService;
import com.kh.letEatGo.member.model.vo.Member;

@Controller
public class MemberController {
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;  //암호화 스프링에 bean으로 등록해야함
	@Autowired
	private MyEncrypt enc;
	
	@RequestMapping("/member/Enroll.do")
	public String memberEnroll() {
		return "member/Enroll";
	}
	@RequestMapping("/member/memberEnrollEnd")
	public String memberEnrollEnd() {
		return "member/memberEnroll";
	}
	
	  @RequestMapping("/member/memberEnrollEnd.do") 
	  public String insertMember(Member m,Model model) {
		  System.out.println(m);
		  m.setMember_Password(pwEncoder.encode(m.getMember_Password()));
			logger.debug(m.getMember_Password());
			//전화번호, 주소, 이메일 암호화
			try {
//				m.setMember_Phone(enc.encrypt(m.getMember_Phone()));
				m.setMember_Email(enc.encrypt(m.getMember_Email()));
				m.setMember_Address(enc.encrypt(m.getMember_Address()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 int result=service.insertMember(m); 
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
//	  return "member/memberEnroll"; 
	  }
	  
	  @RequestMapping("/login_modal.do") 
	  public String login_Modal() {
		  System.out.println("실행");
		  return "member/login_modal";
	  }
	  @RequestMapping("/member/memberLogin.do")
	  public String login() {
		  ModelAndView mv=new ModelAndView();
		return "";
	  }
	  
}
