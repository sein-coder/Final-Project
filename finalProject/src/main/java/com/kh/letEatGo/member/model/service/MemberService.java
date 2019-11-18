package com.kh.letEatGo.member.model.service;

import org.springframework.ui.Model;

import com.kh.letEatGo.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMemberOne(Member m);

	Member selectMemberOne2(Member m);
	 
	int updateMemberPage(Member m);
	
	int deleteMemberPage(Member m);

	int updateAdminPage(Member m);
	
	int insertKakao(Member m);
}
