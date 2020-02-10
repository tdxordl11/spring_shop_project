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


	
}
