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
	
	//admin detail
	public AdminVO adminGetDetail(String user);

	//otp check
	public boolean otpCheck(AdminVO vo);
	
	//관리자 계정 리스트
	public List<AdminVO> adminGetList();
	
	//review 리스트 출력
	public List<ReviewVO> getReviewList();
	
	//review 상세 출력
	public ReviewVO getReviewDetail(int seq);
	
	//qna 리스트출력
	public List<QnaVO> adminQnaList();
	
	//qna 상세 출력
	public QnaVO getQnaDetail(int seq);
	
	//qna 답변등록
	public int qnaUpdate(QnaVO vo);
		
	//notice 리스트 출력
	public List<NoticeVO> noticeGetList();
	
	//notice 상세 출력
	public NoticeVO getNoticeDetail(int seq);
	
	//notice 작성
	public int noticeWrite(NoticeVO vo);
	
	//notice 수정
	public int noticeUpdate(NoticeVO vo);
	
	//슈퍼관리자의 레벨인지 체크
	public String authlevelchk(AdminVO vo);
	
	//관리자 레벨, 계정 활성화 여부 업데이트
	public int adminUpdate(AdminVO vo);
	
	// adminVO에서 레벨,권한 가져오기
	public AdminVO adminUserAuthCheck(String id);
}
