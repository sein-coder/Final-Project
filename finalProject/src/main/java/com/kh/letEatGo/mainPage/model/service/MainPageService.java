package com.kh.letEatGo.mainPage.model.service;

import java.util.List;

import com.kh.letEatGo.mainPage.model.vo.MainPage_Data;

public interface MainPageService {
	
	List<MainPage_Data> selectDataList(String keyword);

}
