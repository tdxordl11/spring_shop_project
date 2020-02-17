package com.spring.shop_project;

import java.util.List;

public interface UserService {

	public String Login();
	
	public int checkUser(UserVO vo);
	
	public String userIdCheck(String id);
	
	public int userSignUp(UserVO vo);
	
	public int apiIdCheck(String id);
	
	// ����� list �����ֱ�
		public List<UserVO> userGetList();
		
		// ����� detail
		public UserVO userGetDetail(String user);
		
		// ����� detail ����
		public int userUpdate(UserVO vo);
		
		// ����� ���� ����
		public void userDelete(String user);
		
		//cs, review, shoporder, group_purchase, auction, discount ���̺� �����ؾ� 
		public void csDelete(String user);
		
		public void reviewDelete(String user);
		
		public void shoporderDelete(String user);
		
		public void group_purchaseDelete(String user);
		
		public void auctionDelete(String user);
		
		public void discountDelete(String user);
		
		// vip
		public List<OrderVO> vipgrade();
	
	
}
