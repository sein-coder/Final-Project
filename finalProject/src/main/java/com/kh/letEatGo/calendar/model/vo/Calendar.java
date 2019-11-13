package com.kh.letEatGo.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Calendar {
	
	private int calendarNo;
	private int partnerNo;
	private String schedule;
	private String startDate;
	private String endDate;
	
	
	

}
