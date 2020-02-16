package com.spring.shop_main;

import java.util.List;

import com.spring.shop_project.ProductVO;

public interface ClientService {

	//제품 리스트 조회 + 무한스크롤 
	public List<ProductVO> getGoodsListcur(String curPage,String pageListSize);
	
	//제품 리스트
	public List<ProductVO> getGoodsListSort(String curPage, String pageListSize, String sort);
}
