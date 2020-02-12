package com.spring.shop_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;

	@Override
	public List<OrderVO> pagingOrder(int[] pagenum) {
		// TODO Auto-generated method stub
		return dao.pagingOrder(pagenum);
	}


	@Override
	public OrderVO getOrderdetail(int seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateViews(int seq) {
		// TODO Auto-generated method stub

	}


}
