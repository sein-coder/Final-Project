package com.kh.letEatGo.order.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int review_No;
	private String review_Content;
	private Date review_Time;
	private int review_Star;
	private String oriname_File1;
	private String rename_File;
	private int order_No;
	private int member_No;
	private int partner_No;
	private String member_Id;
	
}