package com.spring.shop_project;

import java.util.List;

public interface AdminService {

	//admin 회원가입
	public int adminSignUp(AdminVO vo);
	
	//admin id 중복체크
	public String adminIdCheck(String id);
	
	//admin login check(1차)
	public int adminLogin(AdminVO vo);
	
	//admin user optcode load
	public String otpCodeLoad(String id);

	//otp check
	public boolean otpCheck(AdminVO vo);
	
	//관리자 계정 리스트
	public List<AdminVO> adminGetList();
	
	//review 리스트 출력
	public List<ReviewVO> getReviewList();
	
	//review 상세 출력
	public ReviewVO getReviewDetail(int seq);
		
	//notice 리스트 출력
	public List<NoticeVO> noticeGetList();
	
	//notice 상세 출력
	public NoticeVO getNoticeDetail(int seq);
	
	//notice 작성
	public int noticeWrite(NoticeVO vo);
	
	//notice 수정
	public int noticeUpdate(NoticeVO vo);
}
