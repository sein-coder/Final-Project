package com.kh.letEatGo.order.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {

	private int order_no;
	private String order_list;
	private String add_request;
	private int order_price;
	private Date order_time;
	private String pay_yn;
	private String delivery_yn;
	private int partner_no;
	private int member_no;
	
}
