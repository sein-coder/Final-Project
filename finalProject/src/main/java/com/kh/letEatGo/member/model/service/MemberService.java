package com.kh.letEatGo.member.model.service;

import com.kh.letEatGo.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMemberOne(Member m);

	int updateMemberPage(Member m);
	
	int deleteMemberPage(Member m);

	Member selectMemberEmail(Member m);


}
