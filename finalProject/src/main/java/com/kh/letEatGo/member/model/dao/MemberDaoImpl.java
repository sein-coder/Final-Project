package com.kh.letEatGo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		
		return session.insert("member.insertMember",m);
	}

	@Override
	public Member selectMemberOne(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberOne",m);
	}

	@Override
	public int updateMemberPage(SqlSessionTemplate session, Member m) {
		
		return session.update("member.updateMemberPage",m);
	}
	
}
