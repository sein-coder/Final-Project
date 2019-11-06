package com.kh.letEatGo.map.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TruckMap {
	private String xCode;
	private String yCode;
	private String addr;
	private String addr_old;
	private String map_Strart_Time;
	private String map_End_Time;
	
	
}
