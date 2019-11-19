package com.kh.letEatGo.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
			logger.debug(m.getMember_Password());
			m.setMember_Password(pwEncoder.encode(m.getMember_Password()));
			try {
//				  m.setMember_Email(enc.encrypt(m.getMember_Email()));
//		          m.setMember_Phone(enc.encrypt(m.getMember_Phone()));

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
	  public ModelAndView login(Member m, HttpSession session) throws Exception {
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
		  mv.setViewName("redirect:/");
		  if(result2==null) {
			  int result=service.insertKakao(m);
			  result2 = service.selectMemberOne(m);
			  mv.setViewName("/mypage/memberPage");
		  }
	
		 
		  session.setAttribute("loginMember", result2);
		  session.setAttribute("type", "member");
		  Member result3=service.selectMemberOne(m);
		  session.setAttribute("member",result3);
		  //mv.setViewName("redirect:/");
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

	  @RequestMapping("/findIp")
	  public String findmember() {
		  return "member/findIp";		  
	  }
	 @RequestMapping("/member/find_id.do")
		 public String send_mailId(Member m) throws Exception { 
		 	Member result=service.selectMemberEmail(m);
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "rkdqhtmd23@naver.com";
			String hostSMTPpwd = "rkdqhtmd12";
			
			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "rkdqhtmd23@naver.com";
			String fromName = "KBS";
			String subject = "아이디 찾기 인증 메일입니다.\r\n";
			String msg ="";
			msg += "<div align='center'>";
			msg += "<input type=text value='"+result.getMember_Id()+"'";
			msg += "<div style='font-size: 130%'>";
			msg += "</div><br/>";
		
			// 받는 사람 E-Mail 주소
			String mail = result.getMember_Email() ;
			try {
				HtmlEmail htmlemail = new HtmlEmail();
				htmlemail.setDebug(true);
				htmlemail.setCharset(charSet);
				htmlemail.setSSL(true);
				htmlemail.setHostName(hostSMTP);
				htmlemail.setSmtpPort(587);

				htmlemail.setAuthentication(hostSMTPid, hostSMTPpwd);
				htmlemail.setTLS(true);
				htmlemail.addTo(mail, charSet);	
				htmlemail.setFrom(fromEmail, fromName, charSet);
				htmlemail.setSubject(subject);
				htmlemail.setHtmlMsg(msg);
				htmlemail.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
			return "/member/findIp";
		}
	 @RequestMapping("/memberEmail.do")
		public void findEmail(Member m, HttpServletResponse res) {
//			System.out.println(m);
			Member result=service.selectMemberEmail(m);
			String flag=result!=null?"false":"true";
			res.setContentType("application/json;charset=utf-8");
			try {
				res.getWriter().write(flag);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
	 @RequestMapping("/member/find_pw.do")
	 public ModelAndView send_mailPw(Member m) throws Exception {
		 ModelAndView mv = new ModelAndView();
		 
		 //난수발생시켜
		 
		 //난수값을 enc로 encode
		 //원래메일로 보낼애 하나
		 
		 String  pswd = "";
		 StringBuffer sb = new StringBuffer();
		 StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");  // 특수문자 모음, {}[] 같은 비호감문자는 뺌

		 // 대문자 4개를 임의 발생 
		 sb.append((char)((Math.random() * 26)+65));  // 첫글자는 대문자, 첫글자부터 특수문자 나오면 안 이쁨

		 for( int i = 0; i<3; i++) {
		    sb.append((char)((Math.random() * 26)+65));  // 아스키번호 65(A) 부터 26글자 중에서 택일
		 } 

		 // 소문자 4개를 임의발생
		 for( int i = 0; i<4; i++) {
		     sb.append((char)((Math.random() * 26)+97)); // 아스키번호 97(a) 부터 26글자 중에서 택일
		 }  

		 // 숫자 2개를 임의 발생
		 for( int i = 0; i<2; i++) {
		     sb.append((char)((Math.random() * 10)+48)); //아스키번호 48(1) 부터 10글자 중에서 택일
		 }


		 // 특수문자를 두개  발생시켜 랜덤하게 중간에 끼워 넣는다 
		 sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1))); //대문자3개중 하나   
		 sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자4개중 하나

		 pswd = sb.toString();
		 
		
		 //주의할꺼는 변수를 두개로 나눠 하나는(원래였던) 메일로 보내, 하나는 암호화해서 저장
		 
		 
	
		 
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "rkdqhtmd23@naver.com";
		String hostSMTPpwd = "rkdqhtmd12";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "rkdqhtmd23@naver.com";
		String fromName = "KBS";
		String subject = "비밀번호 찾기 및 변경 인증 메일입니다.\r\n";
		String msg ="";
		msg += "<div align='center'>";
		msg += "<p>'임시 비밀번호는"+ pswd+"입니다.'</p>";
		msg += "<div style='font-size: 130%'>";
		msg += "</div><br/>";
		
		// 받는 사람 E-Mail 주소
		String mail = m.getMember_Email() ;
		// 난수를 이메일로 전송
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			
			m.setMember_Password(pwEncoder.encode((pswd)));
			int result=service.updateMemberPassword(m);
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
		mv.setViewName("/member/findIp");
		return mv;
	 }


	  
}
