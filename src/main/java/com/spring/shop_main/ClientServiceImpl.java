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
	public List<ProductVO> getGoodsList(String curPage, String pageListSize) {
		return dao.getGoodsList(curPage,pageListSize);
	}


	@Override
	public List<ProductVO> getGoodsFindListSort(String curPage, String pageListSize, String sort, String ts_key) {
		return dao.getGoodsFindListSort(curPage, pageListSize, sort, ts_key);
	}

	@Override
	public List<ProductVO> getGoodsFindList(String curPage, String pageListSize, String ts_key) {
		return dao.getGoodsFindList(curPage, pageListSize, ts_key);
	}

	@Override
	public ProductVO getCartList(String name) {
		return dao.getCartList(name);
	}

}
