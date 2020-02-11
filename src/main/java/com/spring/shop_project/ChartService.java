package com.spring.shop_project;

import java.util.ArrayList;
import java.util.List;

public interface ChartService {
	
	// 날짜 2개 파라미터로 받아서 그 기간사이의 총판매금 
	public List<OrderVO> incomechart(String[] param);
	
	// 월별 매출 점유율 순위
	public List<OrderVO> getShare(String[] param3);
	
	// 한달 총 매출액
	public int getMonthTotal(String[] param1);
	
	// 현재월 기준 전월 총 매출액
	public int prevMonthTotal(String[] param2);
	
	// 전년동월 총 매출액
	public int prevYearMonthTotal(String[] param);
	
	// 오늘 총 매출액
	public int todaytotalincome();
	
	// 오늘 총 판매량
	public int todaytotalorder();
	
	// 이번달 판매량 top3
	public List<OrderVO> monthtop3(String[] param);
	

}
