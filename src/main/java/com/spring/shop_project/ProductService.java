package com.spring.shop_project;

import java.util.List;

public interface ProductService {
	
	// 상품 관리 페이지 접근
	public List<ProductVO> pagingProduct(int[] pagenum);
	
	// 상품 상세 정보
	public ProductVO getProductdetail(String product_id);
	
	// 상품 추가
	public int insertProduct(ProductVO vo);
	
	// 상품 삭제
	public ProductVO deleteProduct(String product_id);
	
	// 상품 수정
	public int modifyProduct(ProductVO vo);

}
