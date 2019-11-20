package com.kh.letEatGo.partner.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.partner.model.service.PartnerService;
import com.kh.letEatGo.partner.model.vo.Partner;



@SessionAttributes(value= {"loginPartner","msg"})

@Controller
public class PartnerController {
	private Logger logger=LoggerFactory.getLogger(PartnerController.class);
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private MyEncrypt enc;
	@Autowired
	PartnerService service;
	
//	@RequestParam(value="upFile",required=false)MultipartFile[] upFile,

	@RequestMapping("/partner/partnerEnrollEnd.do")
	public ModelAndView insertPartner(
			Partner p,
			@RequestParam(value="upFile",required=false)MultipartFile[] upFile,
			HttpServletRequest req
			) throws Exception { 
		  ModelAndView mv=new ModelAndView();
		  String saveDir=req.getSession().getServletContext().getRealPath("/resources/images/foodtruck");
		  File dir=new File(saveDir);
		  if(!dir.exists()) logger.debug("폴더생성 "+dir.mkdirs());
			//다중파일 서버에 저장로직
			for(MultipartFile f : upFile) {
				if(!f.isEmpty()) {
					//파일명설정(renamed)
					String oriFileName=f.getOriginalFilename();
					/* 파일명에서 확장자빼기 */
					String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
					//rename규칙설정
					SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rnd=(int)(Math.random()*1000);
					String reName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
					//reName된 파일명으로 저장하기
					try {
						f.transferTo(new File(saveDir+"/"+reName));
					}catch(IOException e) {
						e.printStackTrace();
					}
					//서버에 실제 파일 저장완료!
					
					p.setProfile_Old(oriFileName);
					p.setProfile_Re(reName);
				}
			}
			p.setPartner_Password(pwEncoder.encode(p.getPartner_Password()));
			
			try {
				p.setPartner_Permission_No(p.getPartner_Permission_No());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		int result=service.insertPartner(p);
		String msg="";
	 	String loc="";
	 if(result>0) {
		 msg="회원가입완료!";
		 loc="/";
	 }else {
		 msg="회원가입실패!";
		 loc="/member/memberEnrollEnd";
	  } 
	 	mv.addObject("msg",msg);
	 	mv.addObject("loc",loc);
	 	mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/partner/partnerLogin.do")
	public ModelAndView partnerlogin(Partner p, HttpSession session) throws Exception {
		ModelAndView mv=new ModelAndView();
		Partner result=null;
		result=service.selectPartnerOne(p);
		
		String msg="";
		String loc="";
			if(result != null) {
				  if(!pwEncoder.matches(p.getPartner_Password(),result.getPartner_Password())) {
					
					  // 로그인실패
					  msg="로그인실패";
				  } else {
					  // 로그인성공
					  msg="로그인성공";
					  session.setAttribute("loginMember", result);
					  session.setAttribute("type", "partner");
				  }
			  } else {
				  msg="로그인 안됨";
			  }
			  mv.addObject("msg", msg);
			  mv.addObject("loc", loc);
			  mv.setViewName("common/msg");
			  return mv;
		  }
	

	@RequestMapping("/partner/checkId.do")
	public void checkId(Partner p, HttpServletResponse res) {
		Partner result=service.selectPartnerOne(p);
		String flag=result!=null?"false":"true";
		res.setContentType("application/json;charset=utf-8");
		try {
			res.getWriter().write(flag);
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}
	}


	@RequestMapping("/partner/permission.do")
	public void permissionCheck(
			Partner p, HttpServletResponse res) {
		
		Partner result=service.selectPartnerNo(p);
		String flag=result!=null?"false":"true";
		res.setContentType("application/json;charset=utf-8");
		try {
			res.getWriter().write(flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	 @RequestMapping("/partner/find_id.do")
		 public String send_mailId(Partner p) throws Exception { 
//		 	Partner result=service.selectPartnerEmail(p);
		 	List<Partner> list =service.selectPartnerList();
		 	
		 	for(Partner p2:list) {
		 		try {
		 			if(p.getPartner_Email().equals(p2.getPartner_Email())) {
		 				p.setPartner_No(p2.getPartner_No());
		 				p.setPartner_Id(p2.getPartner_Id());
		 			}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 	}
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
			msg += "<input type=text value='"+p.getPartner_Id()+"'";
			msg += "<div style='font-size: 130%'>";
			msg += "</div><br/>";
		
			// 받는 사람 E-Mail 주소
			String mail = p.getPartner_Email() ;
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
			}
			return "/member/findIp";
		}
	 @RequestMapping("/partnerid/partner_Email.do")
		public void findIdEmail(Partner p, HttpServletResponse res)  {
		 Partner result=service.selectPartnerEmail(p);
		 String flag=result!=null?"false":"true";
		 res.setContentType("application/json;charset=utf-8");
		 try {
			 res.getWriter().write(flag);
		 } catch (IOException e) {
			 e.printStackTrace();
		 }
	 }
	 @RequestMapping("/password/partner_Email.do")
		public void findPwEmail(Partner p, HttpServletResponse res)  {
		 Partner result=service.selectPartnerEmail(p);
		 String flag=result!=null?"false":"true";
		 res.setContentType("application/json;charset=utf-8");
		 try {
			 res.getWriter().write(flag);
		 } catch (IOException e) {
			 e.printStackTrace();
		 }
	 }
	
		 
				
		 
		 	//List 로 다가져와서 for문을 돌림 하나씩 다decrypt해서 
		 	//select * from service가져와서
		 	
//		 	List<Partner> list=service.selectPartnerList();\
		 	
		 	
	 
	 @RequestMapping("/partner/find_pw.do")
	 public ModelAndView send_mailPw(Partner p) throws Exception {
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
		String mail = p.getPartner_Email();
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
			
			p.setPartner_Password(pwEncoder.encode((pswd)));
			int result=service.updatePartnerPassword(p);
		} catch (Exception e) {
		}
		
		mv.setViewName("/member/findIp");
		return mv;
	 }
	
}

