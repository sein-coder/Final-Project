package com.kh.letEatGo.calendar.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Calendar {
	
   private int calendar_No;
   private int partner_No;
   private String schedule;
   private Date start_Date;
   private Date end_Date;
   private String calendar_Content;
	
	
	
	

}
