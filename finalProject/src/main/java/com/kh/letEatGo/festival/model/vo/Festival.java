package com.kh.letEatGo.festival.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Festival {
	
	private int fastivalNo;
	private String fastivalTitle;
	private String fastivalContent;
	private Date fastivalDate;
	private int fastivalCount;
	private String Festival_Thumbnail;
	private String fastivalStartDate;
	private String fastivalEndDate;
	private String fastivalPhone;
	private String fastivalHomepage;
	private String Festival_link;
	private String fastivalAddress;
	private String festivalHost;
	private String festivalSub;
	private String fastivalPrice;
	private String Festival_Hashtag;
	private String festivalProceeding;

	
}

