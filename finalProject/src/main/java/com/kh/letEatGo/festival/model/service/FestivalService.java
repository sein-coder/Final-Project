package com.kh.letEatGo.festival.model.service;

import java.util.List;

import com.kh.letEatGo.festival.model.vo.Festival;


public interface FestivalService{
	
	int insertFestival(Festival festival);

	List<Festival> selectFestival(int cPage, int numPerPage);

	Festival selectFestivalOne(int festival_No);
	
	int deleteFestival(int festival_No);

	int updateFormFestival(Festival festival);

	int updateFestivalLike(Festival festival);

	List<Festival> selectLikeCount(Festival festival);

	int selectFestivalCount();

	
	

	
	
	
	

}
