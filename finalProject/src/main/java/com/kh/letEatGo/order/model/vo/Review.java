package com.kh.letEatGo.order.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int review_no;
	private String review_content;
	private Date review_time;
	private int review_star;
	private String oriname_file;
	private String rename_file;
	private int order_no;
	private int member_no;
}
