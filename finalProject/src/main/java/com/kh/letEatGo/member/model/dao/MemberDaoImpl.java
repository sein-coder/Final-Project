package com.kh.letEatGo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.member.model.vo.Member;

public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember",m);
	}

}
