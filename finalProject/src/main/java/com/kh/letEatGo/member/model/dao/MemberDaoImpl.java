package com.kh.letEatGo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectIdAndEmail(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectIdAndEmail",m);
	}

	@Override
	public Member selectMemberOne2(SqlSessionTemplate session, Member m) {
		 return session.selectOne("member.selectMemberOne2",m);

	}

	@Override
	public int updateAdminPage(SqlSessionTemplate session, Member m) {
		return session.update("member.updateAdminPage",m);
	}

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

	@Override
	public int deleteMemberPage(SqlSessionTemplate session, Member m) {
		return session.delete("member.deleteMemberPage",m);
	}

	@Override
	public int insertKakao(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertKakao",m);
	}
	
	@Override
	public Member selectMemberEmail(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberEmail",m);
	}

	@Override
	public int updateMemberPassword(SqlSessionTemplate session, Member m) {
		return session.update("member.updateMemberPassword",m);
	}

}
