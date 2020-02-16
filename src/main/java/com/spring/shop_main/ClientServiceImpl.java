package com.spring.shop_main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop_project.ProductVO;

@Service
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	ClientDAO dao;


	@Override
	public List<ProductVO> getGoodsListSort(String curPage, String pageListSize, String sort) {
		return dao.getGoodsListSort(curPage, pageListSize, sort);
	}

	@Override
	public List<ProductVO> getGoodsListcur(String curPage, String pageListSize) {
		return dao.getGoodsList(curPage,pageListSize);
	}

	public Object getGoodsList(String curPage, String pageListSize) {
		return dao.getGoodsList(curPage, pageListSize);
	}

}
