package com.spring.shop_project;

import java.util.ArrayList;
import java.util.List;

public interface ChartService {
	
	// 날짜 2개 파라미터로 받아서 그 기간사이의 총판매금 
	public List<OrderVO> incomechart(String[] param);
	
	// 월별 매출 점유율 순위
	public List<OrderVO> getShare(String month);
	
	// 한달 총 매출액
	public int getMonthTotal(String month);

}
