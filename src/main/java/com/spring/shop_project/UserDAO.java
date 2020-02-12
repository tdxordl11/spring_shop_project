package com.spring.shop_project;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {
	@Autowired
	SqlSession session;
	
	public int checkUser(UserVO vo){

		return session.selectOne("user.checkuser", vo);
				
	}
	
	public String userIdCheck(String id) {
		String chk = session.selectOne("user.useridcheck", id); 
		return chk;
	}
	
	public int userSignUp(UserVO vo) {
		return session.insert("user.usersignup", vo);
	}
}
