package com.kh.letEatGo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.letEatGo.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSessionTemplate session, Member m);

}
