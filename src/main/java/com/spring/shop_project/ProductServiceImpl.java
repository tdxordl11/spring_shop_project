package com.spring.shop_project;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO dao;
	SqlSession sqlSession;

	@Override
	public List<ProductVO> pagingProduct(int[] pagenum) {
		return dao.pagingProduct(pagenum);
	}

	@Override
	public ProductVO getProductdetail(String product_id) {
		return dao.getProductdetail(product_id);
	}

	@Override
	public ProductVO deleteProduct(String product_id) {
		return dao.productDelete(product_id);
	}

	@Override
	public int insertProduct(ProductVO vo) {
		dao.productInsert(vo);
		/* System.out.println("삽입 ServiceImp"); */
		return 0;
	}
	
	@Override
	public int modifyProduct(ProductVO vo) {
		dao.productModify(vo);
		/* System.out.println("수정 ServiceImp"); */
		return 0;
	}
	
}
