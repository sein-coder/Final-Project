package com.kh.letEatGo.partner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Partner {

	private int partner_No;
	private String partner_Id;
	private String partner_Password;
	private String partner_TruckName;
	private String profile_Old;
	private String profile_Re;
	private String partner_Address;
	private String partner_Email;
	private String partner_Phone;
	private String partner_Menu;
	private String partner_Permission_No;
}