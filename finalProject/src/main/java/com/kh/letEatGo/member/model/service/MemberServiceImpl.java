package com.kh.letEatGo.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.letEatGo.member.model.dao.MemberDao;
import com.kh.letEatGo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	SqlSessionTemplate session;
	@Autowired
	MemberDao dao;
	
	@Override
	public int insertMember(Member m) {
		return dao.insertMember(session,m);
	}

	@Override
	public Member selectMemberOne(Member m) {
		return dao.selectMemberOne(session,m);
	}

	@Override
	public int updateMemberPage(Member m) {
		return dao.updateMemberPage(session,m);
	}

	@Override
	public int deleteMemberPage(Member m) {
		return dao.deleteMemberPage(session,m);
	}

	@Override
	public int insertKakao(Member m) {
		return dao.insertKakao(session, m);
	}

	@Override
	public Member selectMemberOne2(Member m) {
		 return dao.selectMemberOne2(session,m);
	}

	@Override
	public int updateAdminPage(Member m) {
		return dao.updateAdminPage(session,m);
	}


}
