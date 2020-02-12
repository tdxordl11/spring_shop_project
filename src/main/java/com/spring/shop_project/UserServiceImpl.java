package com.spring.shop_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

	@Override
	public String Login() {
		
		return null;
	}

	@Override
	public int checkUser(UserVO vo) {
		return dao.checkUser(vo);
	}

	@Override
	public String userIdCheck(String id) {
		return dao.userIdCheck(id);
	}

	@Override
	public int userSignUp(UserVO vo) {
		return dao.userSignUp(vo);
	}
	
	
	
}
