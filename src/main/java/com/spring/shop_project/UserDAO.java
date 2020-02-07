package com.spring.shop_project;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {
	@Autowired
	SqlSession session;
	
	public int checkUser(UserVO vo){
		int check = 0;
//		System.out.println(session.selectOne("user.checkuser", vo));
				if(session.selectOne("user.checkuser", vo) ==null) {
					check = 0;
				} else if(session.selectOne("user.checkuser", vo).equals(vo.getUser_password())) {
					check = 1;
				} else {
					check = 2;
				}
		return check;
	}
}
