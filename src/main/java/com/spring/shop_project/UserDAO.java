package com.spring.shop_project;

import java.util.List;

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
	
	public int apiIdCheck(String id) {
		int chk = session.selectOne("user.apiidcheck", id); 
		return chk;
	}
	// ����� list �����ֱ�
		public List<UserVO> userGetList() {
			return session.selectList("user.usergetlist");
		}
		
		// ����� detail
		public UserVO userGetDetail(String user) {
			return session.selectOne("user.getuserdetail",user);
		}
		
		// ����� detail ����
		public int userUpdate(UserVO vo) {
			 return session.update("user.userupdate",vo);
		}
		
		// ����� ���� ����
		public void userDelete(String user) {
			session.delete("user.userdelete", user);
		}
		
		//cs, review, shoporder, group_purchase, auction, discount ���̺� �����ؾ� 
		public void csDelete(String user) {
			session.delete("user.csdelete",user);
		}
		
		public void reviewDelete(String user) {
			session.delete("user.reviewdelete",user);
		}
		
		public void shoporderDelete(String user) {
			session.delete("user.shoporderdelete",user);
		}
		
		public void grouppurchaseDelete(String user) {
			session.delete("user.grouppurchasedelete",user);
		}
		
		public void auctionDelete(String user) {
			session.delete("user.auctiondelete",user);
		}
		
		public void discountDelete(String user) {
			session.delete("user.discountdelete",user);
		}
		
		// vip grade
		public List<OrderVO> vipgrade() {
			return session.selectList("user.vipgrade");
		}
	
}
