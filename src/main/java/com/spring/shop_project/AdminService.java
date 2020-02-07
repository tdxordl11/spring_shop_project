package com.spring.shop_project;

import java.util.List;

public interface AdminService {

	//admin ȸ������
	public int adminSignUp(AdminVO vo);
	
	//admin id �ߺ�üũ
	public String adminIdCheck(String id);
	
	//admin login check(1��)
	public int adminLogin(AdminVO vo);
	
	//admin user optcode load
	public String otpCodeLoad(String id);

	//otp check
	public boolean otpCheck(AdminVO vo);
	
	//������ ���� ����Ʈ
	public List<AdminVO> adminGetList();
	
	
	//review ����Ʈ ���
	public List<ReviewVO> getReviewList();
		
	//review ����
	
}
