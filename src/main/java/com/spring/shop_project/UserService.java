package com.spring.shop_project;

public interface UserService {

	public String Login();
	
	public int checkUser(UserVO vo);
	
	public String userIdCheck(String id);
	
	public int userSignUp(UserVO vo);
	
}
