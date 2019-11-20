package com.kh.letEatGo.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Menu {

	private int menu_No;
	private String menu_Name;
	private int menu_Price;
	private String menu_Oriname_File;
	private String menu_Rename_File;
	private int partner_No;
}