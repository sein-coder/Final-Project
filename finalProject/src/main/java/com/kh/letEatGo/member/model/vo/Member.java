package com.kh.letEatGo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private int member_no;
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_age;
	private String member_address;
	private String member_email;
	private String member_phone;
	private String member_gender;
}
