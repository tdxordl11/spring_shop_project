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
		int res = dao.checkUser(vo);
		return res;
	}
	
}
