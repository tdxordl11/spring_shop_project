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
	
	
	public List<OrderVO> getShare(String month) {
		return session.selectList("chart.piechart" , month);
	}
	
	public int getMonthTotal(String month) {
		return session.selectOne("chart.monthtotal", month);
	}
	
}
