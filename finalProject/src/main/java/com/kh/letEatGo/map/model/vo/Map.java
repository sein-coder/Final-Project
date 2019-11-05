package com.kh.letEatGo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Map {

	private int mapNo;
	private String mapStartTime;
	private String mapEndTime;
	private String mapZone;
	private String permission_No;
	
}
