package com.kh.letEatGo.partner.model.vo;


import java.sql.Date;

import lombok.Data;
@Data
public class ProFile {
	
	private int profile_No;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downLoadCount;
	private String status;

}
