package com.kh.letEatGo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSessionTemplate session, Member m);

	Member selectMemberOne(SqlSessionTemplate session, Member m);

	int updateMemberPage(SqlSessionTemplate session,Member m);
	
	int deleteMemberPage(SqlSessionTemplate session,Member m);

	int insertKakao(SqlSessionTemplate session,Member m);
}
