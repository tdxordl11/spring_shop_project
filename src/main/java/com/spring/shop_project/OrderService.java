package com.spring.shop_project;

import java.util.List;


public interface OrderService {
	
	
	public List<OrderVO> pagingOrder(int[] pagenum);
	

	public OrderVO getOrderdetail(int seq);

	public void updateViews(int seq);
	
	public void insertOrder(OrderVO vo);




}
