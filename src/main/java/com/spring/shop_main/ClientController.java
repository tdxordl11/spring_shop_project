package com.spring.shop_main;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop_project.ProductVO;

@Controller
public class ClientController {

	@Autowired
	ClientServiceImpl service;
	
	@RequestMapping(value = "/goods", method = RequestMethod.GET )
	public ModelAndView goods(
			@RequestParam(value = "sort", defaultValue = "null") String sort,
			@RequestParam(value = "curPage", defaultValue = "1") String curPage,
			@RequestParam(value = "pageListSize", defaultValue = "16") String pageListSize
			) {
		ModelAndView mav = new ModelAndView();
		
		
		if(sort.equals("null")) {
			mav.addObject("goodslist",service.getGoodsList(curPage,pageListSize));
		} else {
			mav.addObject("goodslist",service.getGoodsListSort(curPage,pageListSize, sort));
		}
		
		mav.setViewName("goods_list");
		return mav;
	}
	
	@RequestMapping(value = "/goodsScroll", method = RequestMethod.GET )
	@ResponseBody
	public List<ProductVO> goodsScroll(
			@RequestParam(value = "sort", defaultValue = "null") String sort,
			@RequestParam(value = "curPage") String curPage,
			@RequestParam(value = "pageListSize") String pageListSize,
			@RequestParam(value = "ts_key", defaultValue = "null") String ts_key
			) {
		ModelAndView mav = new ModelAndView();
		List<ProductVO> vo;
		
		if(sort.equals("null") && ts_key.equals("null") ) {
			vo = (List<ProductVO>) service.getGoodsList(curPage,pageListSize);
		} else if ( !sort.equals("null") && ts_key.equals("null") ) {
			vo = (List<ProductVO>) service.getGoodsListSort(curPage, pageListSize, sort);
		} else if ( sort.equals("null") && !ts_key.equals("null")) {
			vo = (List<ProductVO>) service.getGoodsFindList(curPage, pageListSize, ts_key);
		} else {
			vo = (List<ProductVO>) service.getGoodsFindListSort(curPage, pageListSize, sort, ts_key);
		}
		return vo;
	}
	
	//검색
	@RequestMapping(value = "/goodsfind", method = RequestMethod.GET )
	public ModelAndView goodsFind(
			@RequestParam(value = "sort", defaultValue = "null") String sort,
			@RequestParam(value = "curPage", defaultValue = "1") String curPage,
			@RequestParam(value = "pageListSize", defaultValue = "16") String pageListSize,
			@RequestParam(value = "ts_key", defaultValue = "null") String ts_key
			) {
		ModelAndView mav = new ModelAndView();
		
		
		if(sort.equals("null")) {
			mav.addObject("goodslist",service.getGoodsFindList(curPage, pageListSize, ts_key));
		} else {
			mav.addObject("goodslist",service.getGoodsFindListSort(curPage, pageListSize, sort, ts_key));
		}
		
		mav.setViewName("goods_list");
		return mav;
	}
	

	@RequestMapping(value = "/cart_view", method = RequestMethod.GET )
	public ModelAndView cartView(@RequestParam(value="product_list") String product_list) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> pro_list = new ArrayList<ProductVO>();
		
		if(!product_list.isEmpty()) {
			try {
				product_list = URLDecoder.decode(product_list, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			String[] list = product_list.split(",");
			
			for(String product : list) {
				String name = product.split(":")[0];
				String balance = product.split(":")[1];
				
				ProductVO vo = service.getCartList(name);
				//임시
				vo.setProduct_image(vo.getProduct_image().split(",")[0]);
				
				pro_list.add(vo);
			}	
		} 
		
		mav.addObject("pro_list",pro_list);
		mav.setViewName("cart_view");
		return mav;
	}
}
