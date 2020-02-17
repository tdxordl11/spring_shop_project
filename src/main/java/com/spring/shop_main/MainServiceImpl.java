package com.spring.shop_main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop_project.ProductVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO dao;

	@Override
	public ProductVO getProductInfo(String gid) {
		return dao.getProductInfo(gid);
	}

}
