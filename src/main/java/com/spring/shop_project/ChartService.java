package com.spring.shop_project;

import java.util.ArrayList;
import java.util.List;

public interface ChartService {
	
	// ��¥ 2�� �Ķ���ͷ� �޾Ƽ� �� �Ⱓ������ ���Ǹű� 
	public List<OrderVO> incomechart(String[] param);
	
	// ���� ���� ������ ����
	public List<OrderVO> getShare(String month);
	
	// �Ѵ� �� �����
	public int getMonthTotal(String month);

}
