package com.kh.letEatGo.partner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Partner {
	
	private String partner_Id;
	private String partner_Password;
	private String partner_Name;
	private String partner_Age;
	private String partner_Address;
	private String partner_Email;
	private String partner_Phone;
	private String partner_Menu;
}
