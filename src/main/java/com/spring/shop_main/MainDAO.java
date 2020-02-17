package com.spring.shop_main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.shop_project.ProductVO;

@Component
public class MainDAO {

	@Autowired
	SqlSession session;
	
	public ProductVO getProductInfo(String gid) {
		return session.selectOne("main.getproductinfo", gid);
	}
}
