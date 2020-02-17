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
	
	//admin detail
	public AdminVO adminGetDetail(String user);

	//otp check
	public boolean otpCheck(AdminVO vo);
	
	//������ ���� ����Ʈ
	public List<AdminVO> adminGetList();
	
	//review ����Ʈ ���
	public List<ReviewVO> getReviewList();
	
	//review �� ���
	public ReviewVO getReviewDetail(int seq);
	
	//qna ����Ʈ���
	public List<QnaVO> adminQnaList();
	
	//qna �� ���
	public QnaVO getQnaDetail(int seq);
	
	//qna �亯���
	public int qnaUpdate(QnaVO vo);
		
	//notice ����Ʈ ���
	public List<NoticeVO> noticeGetList();
	
	//notice �� ���
	public NoticeVO getNoticeDetail(int seq);
	
	//notice �ۼ�
	public int noticeWrite(NoticeVO vo);
	
	//notice ����
	public int noticeUpdate(NoticeVO vo);
	
	//���۰������� �������� üũ
	public String authlevelchk(AdminVO vo);
	
	//������ ����, ���� Ȱ��ȭ ���� ������Ʈ
	public int adminUpdate(AdminVO vo);
	
	// adminVO���� ����,���� ��������
	public AdminVO adminUserAuthCheck(String id);
	
	public List<OrderVO> pagingOrder(int[] pagenum);
}
