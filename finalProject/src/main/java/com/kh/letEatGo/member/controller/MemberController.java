package com.kh.letEatGo.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.member.model.service.MemberService;
import com.kh.letEatGo.member.model.vo.Member;



@SessionAttributes(value= {"loginMember","msg"}) //여기들어가는 값은 배열로 받을 수 있음 키값이 들어감

@Controller
public class MemberController {
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;  //암호화 스프링에 bean으로 등록해야함
	@Autowired
	private MyEncrypt enc;
	
	@RequestMapping("/member/memberEnrollEnd")
	public String memberEnrollEnd() {
		return "member/memberEnroll";
	}
	
	  @RequestMapping("/member/memberEnrollEnd.do") 
	  public String insertMember(Member m,Model model) {
		  System.out.println(m);
		  m.setMember_Password(pwEncoder.encode(m.getMember_Password()));
			logger.debug(m.getMember_Password());
			
			try {
				
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
	  public ModelAndView login(Member m, HttpSession session) {
		  ModelAndView mv=new ModelAndView();
		  Member result = null;
		  result = service.selectMemberOne(m);
		  String msg="";
		  String loc="";
		  if(result != null) {
			  if(!pwEncoder.matches(m.getMember_Password(), result.getMember_Password())) {
				  // 로그인실패
				  msg="로그인실패";
			  } else {
				  // 로그인성공
				  msg="로그인성공";
				  session.setAttribute("loginMember", result);
				  session.setAttribute("type", "member");
			  }
		  } else {
			  msg="로그인 안됨";
		  }
		  mv.addObject("msg", msg);
		  mv.addObject("loc", loc);
		  mv.setViewName("common/msg");
		return mv;

	  }
	  @RequestMapping("/kakao")
	  public ModelAndView login(String email,String gender,String id, HttpSession session) {
		  ModelAndView mv=new ModelAndView();
		  Member m=new Member();
		  String msg="dd";
		  String loc="";
		  m.setMember_Id(id);
		  m.setMember_Password("비밀번호를 입력하시오.");
		  m.setMember_Age("나이를 입력하시오.");
		  m.setMember_Phone("전화번호를 입력하시오.");
		  if(gender!=null) {
			  if(gender==("male")) {
			  m.setMember_Gender("남");
			  }else {
			  m.setMember_Gender("여");
			  }
		  }else {
		  m.setMember_Gender("성별을 입력하시오.");
		  }
		  if(email!=null) {
			  m.setMember_Email(email);
		  }else {
			  m.setMember_Email("이메일을 입력하시오.");
		  }
		  
		  Member result2;
		  
		  result2 = service.selectMemberOne(m);
		  
		  if(result2==null) {
			  int result=service.insertKakao(m);
			  result2 = service.selectMemberOne(m);
		  }
		 
		  session.setAttribute("loginMember", result2);
		  session.setAttribute("type", "member");
		  mv.addObject("msg", msg);
		  mv.addObject("loc", loc);
		  mv.setViewName("redirect:/");
		return mv;

	  }
	  
	  @RequestMapping("/Logout.do")
		public String logout(HttpSession session,SessionStatus s) {
			
			if(!s.isComplete()) {
				s.setComplete();//로그아웃 SessionAttributes
				session.invalidate();
			}
			return "redirect:/";
		}
	  @RequestMapping("/member/checkId.do")
		public void checkId(Member m, HttpServletResponse res) {
			System.out.println(m);
			Member result=service.selectMemberOne(m);
			String flag=result!=null?"false":"true";
			res.setContentType("application/json;charset=utf-8");
			try {
				res.getWriter().write(flag);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	  
}
