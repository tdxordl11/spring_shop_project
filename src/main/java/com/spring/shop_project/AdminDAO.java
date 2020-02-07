package com.spring.shop_project;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession session;
	
	public int adminSignUp(AdminVO vo) {
		int i = session.insert("shop.adminsignup", vo);
		return i;
	}

	public String adminIdCheck(String id) {
		String chk = session.selectOne("shop.adminidcheck", id); 
		return chk;
	}

	public int adminLogin(AdminVO vo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("admin_id",vo.getAdmin_id());
		map.put("admin_password",vo.getAdmin_password());
		int chk = Integer.parseInt(session.selectOne("shop.logincheck", map)); 
		return chk;
	}

	public String otpCodeLoad(String id) {
		return session.selectOne("shop.otpcodeload", id);
	}

	public List<AdminVO> adminGetList() {
		return session.selectList("shop.admingetlist");
	}

	public List<ReviewVO> getReviewList() {
		return session.selectList("shop.getreviewlist");
	}
	


	
}
