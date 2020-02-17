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

	public ReviewVO getReviewDetail(int seq) {
		return session.selectOne("shop.getreviewdetail", seq);
	}

	public List<NoticeVO> noticeGetList() {
		return session.selectList("shop.getnoticelist");
	}

	public NoticeVO getNoticeDetail(int seq) {
		return session.selectOne("shop.getnoticedetail", seq);
	}

	public int noticeWrite(NoticeVO vo) {
		return session.insert("shop.noticewrite",vo);
	}

	public int noticUpdate(NoticeVO vo) {
		return session.update("shop.noticeupdate",vo);
	}

	public List<QnaVO> adminQnaList() {
		return session.selectList("shop.getqnalist");
	}

	public QnaVO getQnaDetail(int seq) {
		return session.selectOne("shop.getqnadetail", seq);
	}

	public int qnaUpdate(QnaVO vo) {
		return session.update("shop.qnaupdate",vo);
	}

	public AdminVO adminGetDetail(String user) {
		return session.selectOne("shop.getadmindetail",user);
	}
	
	//슈퍼관리자의 레벨인지 체크
	public String authlevelchk(AdminVO vo) {
		return session.selectOne("shop.authlevelchk", vo);
	}
	
	// 관리자 레벨, 계정 활성화 여부 업데이트
	public int adminUpdate(AdminVO vo) {
		return session.update("shop.adminupdate",vo);
	}
	
	// adminVO에서 레벨,권한 가져오기
	public AdminVO adminUserAuthCheck(String id) {
		return session.selectOne("shop.getalladmin", id);
	}
	
	
	
}
