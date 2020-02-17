package com.spring.shop_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	GoogleOTPService otpservice;
	
	@Autowired
	AdminDAO dao;
	
	@Override
	public int adminSignUp(AdminVO vo) {
		return dao.adminSignUp(vo);
	}

	@Override
	public String adminIdCheck(String id) {
		return dao.adminIdCheck(id);
	}

	@Override
	public int adminLogin(AdminVO vo) {
		return dao.adminLogin(vo);
	}

	@Override
	public String otpCodeLoad(String id) {
		return dao.otpCodeLoad(id);
	}
	
	@Override
	public boolean otpCheck(AdminVO vo) {
		String otpcode = otpCodeLoad(vo.getAdmin_id());
		return otpservice.checkCode(vo.getAdmin_otpkey(), otpcode);
	}

	@Override
	public List<AdminVO> adminGetList() {
		return dao.adminGetList();
	}

	@Override
	public List<ReviewVO> getReviewList() {
		return dao.getReviewList();
	}

	@Override
	public ReviewVO getReviewDetail(int seq) {
		return dao.getReviewDetail(seq);
	}

	@Override
	public List<NoticeVO> noticeGetList() {
		return dao.noticeGetList();
	}

	@Override
	public NoticeVO getNoticeDetail(int seq) {
		return dao.getNoticeDetail(seq);
	}

	@Override
	public int noticeWrite(NoticeVO vo) {
		return dao.noticeWrite(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		return dao.noticUpdate(vo);
	}

	@Override
	public List<QnaVO> adminQnaList() {
		return dao.adminQnaList();
	}

	@Override
	public QnaVO getQnaDetail(int seq) {
		return dao.getQnaDetail(seq);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		return dao.qnaUpdate(vo);
	}

	@Override
	public AdminVO adminGetDetail(String user) {
		return dao.adminGetDetail(user);
	}
	
	//슈퍼관리자의 레벨인지 체크
		@Override
		public String authlevelchk(AdminVO vo) {
			return dao.authlevelchk(vo);
		}
	
	// 관리자 레벨, 계정 활성화 여부 업데이트
		@Override
		public int adminUpdate(AdminVO vo) {
			return dao.adminUpdate(vo);
		}
	
	// adminVO에서 레벨,권한 가져오기
		@Override
		public AdminVO adminUserAuthCheck(String id) {
			return dao.adminUserAuthCheck(id);
		}
	
	@Override
	public List<OrderVO> pagingOrder(int[] pagenum) {
		return dao.pagingOrder(pagenum);
	}


	
}
