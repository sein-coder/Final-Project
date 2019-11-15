package com.kh.letEatGo.accountBook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Account {
	private String account_Number;
	private String account_Bank;
	private int partner_No;
	private String account_Name;
	private int account_Balance;
}
