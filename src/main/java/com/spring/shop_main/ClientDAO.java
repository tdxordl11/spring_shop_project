package com.spring.shop_main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop_project.ProductVO;

@Repository
public class ClientDAO {

	@Autowired
	SqlSession session;

	public List<ProductVO> getGoodsListSort(String curPage, String pageListSize, String sort) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("curPage", curPage);
		condition.put("pageListSize", pageListSize);
		condition.put("orderKind" , sort );
		List<ProductVO> vo = session.selectList("client.getgoodslistallsort", condition);
		return vo;
	}

	public List<ProductVO> getGoodsList(String curPage, String pageListSize) {
		int[] paging = {Integer.parseInt(curPage), Integer.parseInt(pageListSize)};
		List<ProductVO> vo = session.selectList("client.getgoodslistall", paging);
		
		return vo;
	}

	public List<ProductVO> getGoodsFindListSort(String curPage, String pageListSize, String sort, String ts_key) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("curPage", curPage);
		condition.put("pageListSize", pageListSize);
		condition.put("orderKind" , sort );
		condition.put("ts_key", ts_key);
		List<ProductVO> vo = session.selectList("client.getgoodslistfindsort", condition);
		return vo;
	}

	public List<ProductVO> getGoodsFindList(String curPage, String pageListSize, String ts_key) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("curPage", curPage);
		condition.put("pageListSize", pageListSize);
		condition.put("ts_key" , ts_key );
		List<ProductVO> vo = session.selectList("client.getgoodslistfind", condition);
		
		return vo;
	}

	public ProductVO getCartList(String name) {
		return session.selectOne("client.getcartlist", name);
	}
	
	
}
