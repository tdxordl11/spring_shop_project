package com.spring.shop_project;

import java.util.List;

public interface UserService {

	public String Login();
	
	public int checkUser(UserVO vo);
	
	// 사용자 list 보여주기
	public List<UserVO> userGetList();
	
	// 사용자 detail
	public UserVO userGetDetail(String user);
	
	// 사용자 detail 수정
	public int userUpdate(UserVO vo);
	
	// 사용자 계정 삭제
	public void userDelete(String user);
	
	//cs, review, shoporder, group_purchase, auction, discount 테이블도 삭제해야 
	public void csDelete(String user);
	
	public void reviewDelete(String user);
	
	public void shoporderDelete(String user);
	
	public void group_purchaseDelete(String user);
	
	public void auctionDelete(String user);
	
	public void discountDelete(String user);
	
	// vip
	public List<OrderVO> vipgrade();
	
}
