package com.spring.shop_main;

import java.util.List;

import com.spring.shop_project.ProductVO;
import com.spring.shop_project.QnaVO;

public interface ClientService {

	//제품 리스트 조회 + 무한스크롤 
	public List<ProductVO> getGoodsList(String curPage,String pageListSize);
	
	//제품 리스트
	public List<ProductVO> getGoodsListSort(String curPage, String pageListSize, String sort);
	
	//제품 리스트 조회 + 무한스크롤  ( 검색 )
	public List<ProductVO> getGoodsFindList(String curPage,String pageListSize, String ts_key);
	
	//제품 리스트 (검색)
	public List<ProductVO> getGoodsFindListSort(String curPage, String pageListSize, String sort, String ts_key);
	
	//장바구니 조회
	public ProductVO getCartList(String name);
	
	//게시글 작성
	public int insertQna(QnaVO vo);
}
