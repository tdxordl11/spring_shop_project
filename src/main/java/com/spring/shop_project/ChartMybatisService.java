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
	public List<OrderVO> getShare(String month) {
		return dao.getShare(month);
	}

	@Override
	public int getMonthTotal(String month) {
		return dao.getMonthTotal(month);
	}
	
	
	
	
}
