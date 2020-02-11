package com.spring.shop_project;

import java.util.ArrayList;
import java.util.List;

public interface ChartService {
	
	// ��¥ 2�� �Ķ���ͷ� �޾Ƽ� �� �Ⱓ������ ���Ǹű� 
	public List<OrderVO> incomechart(String[] param);
	
	// ���� ���� ������ ����
	public List<OrderVO> getShare(String[] param3);
	
	// �Ѵ� �� �����
	public int getMonthTotal(String[] param1);
	
	// ����� ���� ���� �� �����
	public int prevMonthTotal(String[] param2);
	
	// ���⵿�� �� �����
	public int prevYearMonthTotal(String[] param);
	
	// ���� �� �����
	public int todaytotalincome();
	
	// ���� �� �Ǹŷ�
	public int todaytotalorder();
	
	// �̹��� �Ǹŷ� top3
	public List<OrderVO> monthtop3(String[] param);
	

}
