package com.spring.shop_main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop_project.QnaVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;
	
	@Override
	public int qnaUpdate(QnaVO vo) {
		return dao.qnaUpdate(vo);
	}

	@Override
	public QnaVO getQnaDetail(int seq) {
		return dao.getQnaDetail(seq);
	}

	@Override
	public List<QnaVO> adminQnaList() {
		return dao.adminQnaList();
	}
	
	

}
