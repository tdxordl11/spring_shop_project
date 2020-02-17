package com.spring.shop_project;

import java.util.List;

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

	@Override
	public int apiIdCheck(String id) {
		return dao.apiIdCheck(id);
	}

	// ����� list �����ֱ�
		@Override
		public List<UserVO> userGetList() {
			return dao.userGetList();
		}

		// ����� detail
		@Override
		public UserVO userGetDetail(String user) {
			return dao.userGetDetail(user);
		}
		
		// ����� detail ����
		@Override
		public int userUpdate(UserVO vo) {
			return dao.userUpdate(vo);
		}

		// ����� ���� ����
		@Override
		public void userDelete(String user) {
			dao.userDelete(user);
		}

		//cs, review, shoporder, group_purchase, auction, discount ���̺� �����ؾ� 
		@Override
		public void csDelete(String user) {
			dao.csDelete(user);
			
		}

		@Override
		public void reviewDelete(String user) {
			dao.reviewDelete(user);
			
		}

		@Override
		public void shoporderDelete(String user) {
			dao.shoporderDelete(user);
			
		}

		@Override
		public void group_purchaseDelete(String user) {
			dao.grouppurchaseDelete(user);
			
		}

		@Override
		public void auctionDelete(String user) {
			dao.auctionDelete(user);
			
		}

		@Override
		public void discountDelete(String user) {
			dao.discountDelete(user);
			
		}

		// vip
		@Override
		public List<OrderVO> vipgrade() {
			return dao.vipgrade();
		}
	
	
	
}
