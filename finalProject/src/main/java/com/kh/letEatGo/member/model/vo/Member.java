package com.kh.letEatGo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int member_No;
	private String member_Id;
	private String member_Password;
	private String member_Age;
	private String member_Gender;
	private String member_Email;
	private String member_Phone;
}
