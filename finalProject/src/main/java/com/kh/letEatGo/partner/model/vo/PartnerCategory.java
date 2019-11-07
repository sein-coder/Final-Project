package com.kh.letEatGo.partner.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PartnerCategory {

	private int permission_no;
	private int partner_no;
	private String xcode;
	private String state;
	private String addr;
	private String addr_old;
	private String post;
	private String permission_date;
	private String hygiene_conditions;
	private String hygiene_type;
	private String ycode;
	private String total_scale;
	private String nm;
}
