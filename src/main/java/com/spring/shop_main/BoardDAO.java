package com.spring.shop_main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.shop_project.QnaVO;

@Component
public class BoardDAO {
	
	@Autowired
	SqlSession session;
	
	public List<QnaVO> adminQnaList() {
		return session.selectList("board.getqnalist");
	}
	
	public QnaVO getQnaDetail(int seq) {
		return session.selectOne("board.getqnadetail", seq);
	}

	public int qnaUpdate(QnaVO vo) {
		return session.update("board.qnaupdate",vo);
	}

}
