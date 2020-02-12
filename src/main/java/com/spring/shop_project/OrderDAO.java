package com.spring.shop_project;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Autowired
	SqlSession session;
	
//	public List<OrderVO> getAllList(){
//		return session.selectList("order.allorder");
//	}
//	
	public List<OrderVO> pagingOrder(int[] pagenum){
		return session.selectList("order.orderpaging", pagenum);
	}
//	
//	public int orderTotal() {
//		return session.selectOne("order.ordercnt");
//	}
//	
//	public void insertOrder(OrderVO vo) {
//		session.insert("order.insertorder", vo);
//	}
//	
//	public int checkMember(String name) {
//		int check = 0;
//	if(session.selectOne("order.checkmember", name)==null){
//		check = 0;
//			
//	}else if(session.selectOne("order.checkmember", name).equals(name)) {
//		check = 1;
//		}
//		return check;
//	}
//	
	public OrderVO getOrderdetail(int seq){
		return session.selectOne("order.orderdetail", seq);
	}
//	
//	public void updateViews(int seq) {
//		session.update("order.updateviews", seq);
//	}
//	
//	public void updateOrder(OrderVO vo) {
//		session.update("order.updateorder", vo);
//	}
//	
//	public void deleteOrder(int order_seq) {
//		session.delete("order.deleteorder", order_seq);
//	}
//	
//	public int getMaxCount() {
//		return session.selectOne("order.ordercnt");
//	}
}
