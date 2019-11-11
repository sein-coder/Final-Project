package com.kh.letEatGo.festival.model.service;

import java.util.List;

import com.kh.letEatGo.festival.model.vo.Festival;


public interface FestivalService{
	
	int insertFestival(Festival festival);

	List<Festival> selectFestival();

	Festival selectFestivalOne(int festival_No);
	
	int deleteFestival(int festival_No);

	int updateFestival(Festival festival);

	

	
	
	
	

}
