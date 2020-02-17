package com.spring.shop_project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartMybatisService implements ChartService {
	@Autowired
	ChartDAO dao;

	@Override
	public List<OrderVO> incomechart(String[] param) {
		return dao.TotalIncome(param);
	}

	@Override
	public List<OrderVO> getShare(String[] param3) {
		return dao.getShare(param3);
	}

	@Override
	public int getMonthTotal(String[] param1) {
		return dao.getMonthTotal(param1);
	}

	@Override
	public int prevMonthTotal(String[] param2) {
		return dao.prevMonthTotal(param2);
	}

	@Override
	public int prevYearMonthTotal(String[] param) {
		return dao.prevYearMonthTotal(param);
	}

	@Override
	public String todaytotalincome() {
		return dao.todaytotalincome();
	}

	@Override
	public String todaytotalorder() {
		return dao.todaytotalorder();
	}

	// 이번 주 총매출
	@Override
	public String weektotalincome() {
		return dao.weektotalincome();
	}

	//이번주 총 판매량
	@Override
	public String weektotalorder() {
		return dao.weektotalorder();
	}
	
	// monthtop3
	@Override
	public List<OrderVO> monthtop3(String[] param) {
		return dao.monthtop3(param);
	}

	
	
	
	
	
	
}
