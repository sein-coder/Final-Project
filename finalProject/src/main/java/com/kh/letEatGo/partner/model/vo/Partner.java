package com.kh.letEatGo.partner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Partner {

	private int partner_no;
	private String partner_Id;
	private String partner_password;
	private String partner_name;
	private String partner_age;
	private String partner_address;
	private String partner_email;
	private String partner_phone;
	private String partner_gender;
	private String partner_menu;
}
