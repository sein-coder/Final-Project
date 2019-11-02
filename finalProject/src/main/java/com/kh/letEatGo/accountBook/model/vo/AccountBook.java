package com.kh.letEatGo.accountBook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AccountBook {
	private int account_No;
	private String account_Date;
	private String account_LocCode;
	private String account_Type;
	private String account_Clause;
	private String account_Item;
	private String account_Summary;
	private int account_Outcome;
	private int account_Income;
	private int account_Balance;
	private int partner_No;
	private int account_Revenue;
}
