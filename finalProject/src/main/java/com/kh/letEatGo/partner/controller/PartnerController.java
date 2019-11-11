package com.kh.letEatGo.partner.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.letEatGo.common.encrypt.MyEncrypt;
import com.kh.letEatGo.partner.model.service.PartnerService;
import com.kh.letEatGo.partner.model.vo.Partner;




@SessionAttributes(value= {"loginMember","msg"})
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
			) {
		  
		  ModelAndView mv=new ModelAndView();
		  
		  String saveDir=req.getSession().getServletContext().getRealPath("/resources/upload/board");
		  File dir=new File(saveDir);
		  if(!dir.exists()) logger.debug("폴더생성 "+dir.mkdirs());
			//다중파일 서버에 저장로직
			for(MultipartFile f : upFile) {
				if(!f.isEmpty()) {
					//파일명설정(renamed)
					String oriFileName=f.getOriginalFilename();
					System.out.println(oriFileName);
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
					System.out.println(oriFileName);
				}
			}
		  p.setPartner_Password(pwEncoder.encode(p.getPartner_Password()));
			logger.debug(p.getPartner_Password());
			//전화번호, 주소, 이메일 암호화
			try {
				p.setPartner_Phone(enc.encrypt(p.getPartner_Phone()));
				p.setPartner_Email(enc.encrypt(p.getPartner_Email()));
				p.setPartner_Address(enc.encrypt(p.getPartner_Address()));
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
	
	@RequestMapping("/partner/partnerLogin.do")
	public ModelAndView partnerlogin(Partner p,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Partner result=service.selectPartnerOne(p);
		String msg="";
		String loc="";
			if(result != null) {
				  if(!pwEncoder.matches(p.getPartner_Password(), result.getPartner_Password())) {
					  // 로그인실패
					  msg="로그인실패";
				  } else {
					  // 로그인성공
					  msg="로그인성공";
					  session.setAttribute("loginMember", result);		
				  }
			  } else {
				  msg="로그인 안됨";
			  }
			  mv.addObject("msg", msg);
			  mv.addObject("loc", loc);
			  mv.setViewName("common/msg");
			  return mv;
		  }
	@RequestMapping("/partner/partnerLogout.do")
	public String partnerlogout(HttpSession session,SessionStatus s) {

		if(!s.isComplete()) {
			s.setComplete();//로그아웃 SessionAttributes
			session.invalidate();
			
	}
		return "redirect:/";
	}
	@RequestMapping(value="/partner/checkId.do", method= RequestMethod.GET)
	@ResponseBody
		public void checkId(Partner p,
		HttpServletResponse res) {
	Partner result=service.selectPartnerOne(p);
	boolean flag=result!=null?false:true;
	res.setContentType("application/json;charset=utf-8");
	try {
		res.getOutputStream().print(flag);
	} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
