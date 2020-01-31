package com.spring.shop_project;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserMybatisDAO {
	@Autowired
	SqlSession session;
	
	
}
