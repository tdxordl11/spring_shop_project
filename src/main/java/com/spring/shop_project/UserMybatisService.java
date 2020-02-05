package com.spring.shop_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserMybatisService implements UserService {
	@Autowired
	UserMybatisDAO dao;

	@Override
	public String Login() {
		
		return null;
	}

	
	
}
