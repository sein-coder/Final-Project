package com.kh.letEatGo.partner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Partner {

	private int partner_no;
	private String partner_id;
	private String partner_password;
	private String partner_truckname;
	private String partner_profile_old;
	private String partner_profile_re;
	private String partner_email;
	private String partner_phone;
	private String partner_address;
	private String partner_menu;
	private String partner_permission_no;
	private double starCount;
	private int reviewCount;
}
