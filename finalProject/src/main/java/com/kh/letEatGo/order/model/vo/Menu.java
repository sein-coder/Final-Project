package com.kh.letEatGo.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Menu {

	private int menu_no;
	private String menu_name;
	private int menu_price;
	private String menu_oriname_file;
	private String menu_rename_file;
	private int partner_no;
}
