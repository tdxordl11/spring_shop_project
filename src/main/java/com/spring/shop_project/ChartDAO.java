package com.spring.shop_project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChartDAO {
	@Autowired
	SqlSession session;
	
	public List<OrderVO> TotalIncome(String[] param) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startdate", param[0]);
		map.put("enddate", param[1]);
		return session.selectList("chart.incomechart", map);
	}
	
	
	public List<OrderVO> getShare(String[] param3) {
		HashMap<String, String> map3 = new HashMap<String, String>();
		map3.put("month", param3[0]);
		map3.put("year", param3[1]);
		return session.selectList("chart.piechart" , map3);
	}
	
	public int getMonthTotal(String[] param1) {
		HashMap<String, String> map1 = new HashMap<String, String>();
		map1.put("month", param1[0]);
		map1.put("year", param1[1]);
		return session.selectOne("chart.monthtotal", map1);
	}
	
	public int prevMonthTotal(String[] param2) {
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("prevmonth", param2[0]);
		map2.put("year", param2[1]);
		return session.selectOne("chart.prevmonthtotal", map2);
	}
	
	// 전년동기 대비 
	public int prevYearMonthTotal(String[] param) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("month", param[0]);
		map.put("prevyear", param[1]);
		return session.selectOne("chart.prevyeartotal", map);
	}
	
	// 오늘 총 매출액 
	public String todaytotalincome() {
		return session.selectOne("chart.todaytotalincome");
	}
	
	// 오늘 총 판매량
	public String todaytotalorder() {
		return session.selectOne("chart.todaytotalorder");
	}
	
	// 이번달 판매량 top3
	public List<OrderVO> monthtop3(String[] param) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("month", param[0]);
		map.put("year", param[1]);
		return session.selectList("chart.monthtop3", map);
	}
}
