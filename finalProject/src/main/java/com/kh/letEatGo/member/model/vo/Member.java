package com.kh.letEatGo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberAge;
	private String memberAddress;
	private String memberEmail;
	private String memberPhone;
	private String memberGender;
	
}
