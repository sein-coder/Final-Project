package com.kh.letEatGo.order.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {

	private int order_No;
	private String order_List;
	private String add_Request;
	private int order_Price;
	private Date order_Time;
	private String reservation_YN;
	private int partner_No;
	private int member_No;
	
}
