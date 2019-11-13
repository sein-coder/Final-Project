package com.kh.letEatGo.festival.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Festival {
	
	private int festival_No;
	private String festival_Title;
	private String festival_Content;
	private int festival_Count;
	private String festival_Thumbnail;
	private String festival_StartDate;
	private String festival_EndDate;
	private String festival_Phone;
	private String festival_Homepage;
	private String festival_Address;
	private String festival_Host;
	private String festival_Sub;
	private String festival_Price;
	private String festival_Proceeding;

	
}

