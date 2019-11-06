package com.kh.letEatGo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private String member_Id;
	private String member_Password;
	private String member_Name;
	private String member_Age;
	private String member_Address;
	private String member_Email;
	private String member_Phone;
	private String member_Gender;
	
}
