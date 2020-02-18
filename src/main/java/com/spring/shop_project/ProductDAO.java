package com.spring.shop_project;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@Autowired
	SqlSession session;
	
	public List<ProductVO> pagingProduct(int[] pagenum){
		return session.selectList("product.productpaging", pagenum);
	}
	
	public ProductVO getProductdetail(String product_id) {
		return session.selectOne("product.product_detail", product_id);
	}
	
	public ProductVO productDelete(String product_id) {
		return session.selectOne("product.product_delete", product_id);
	}
	
	public int productInsertPage(ProductVO vo) {
		return session.selectOne("product.product_detail", vo);
	}
	
	public int productModifyPage(ProductVO vo) {
		return session.selectOne("product.product_detail", vo);
	}
	
	public int productInsert(ProductVO vo) {
		return session.insert("product.product_insert", vo);
	}
	
	public int productModify(ProductVO vo) {
		return session.update("product.product_modify", vo);
	}
	
}
