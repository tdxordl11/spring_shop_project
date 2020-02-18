package com.spring.shop_main;

import java.util.List;

import com.spring.shop_project.QnaVO;

public interface BoardService {
	
	public int qnaUpdate(QnaVO vo);
	
	public QnaVO getQnaDetail(int seq);
	
	public List<QnaVO> adminQnaList();

}
