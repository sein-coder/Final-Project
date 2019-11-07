package com.kh.letEatGo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember",m);
	}

	@Override
	public Member selectMemberOne(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember",m);
	}
}
