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
