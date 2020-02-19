package com.spring.shop_main;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop_project.OrderService;
import com.spring.shop_project.OrderVO;
import com.spring.shop_project.ProductVO;

@Controller
public class ClientController {

	@Autowired
	ClientServiceImpl service;
	

	@Autowired
	OrderService orderservice;
	
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
		int totalprice = 0;
		
		if(!product_list.equals("undefined")) {
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
					if(!vo.getProduct_image().equals("")) {
						vo.setProduct_image(vo.getProduct_image().split(",")[0]);
						totalprice += vo.getProduct_price();
					}	
					pro_list.add(vo);
				}	
			}
			
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		String ch = dc.format(totalprice);
		
		mav.addObject("totalprice",ch);
		mav.addObject("pro_list",pro_list);
		mav.setViewName("cart_view");
		return mav;
	}
	
	@RequestMapping(value = "/cart_order", method = RequestMethod.GET )
	public ModelAndView orderView(@RequestParam(value="product_list") String product_list) {
		ModelAndView mav = new ModelAndView();
		
		List<ProductVO> pro_list = new ArrayList<ProductVO>();
		int totalprice = 0;
		
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
				totalprice += vo.getProduct_price();
				pro_list.add(vo);
			}	
		} 
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		String ch = dc.format(totalprice);
		
		mav.addObject("total_price", totalprice);
		mav.addObject("totalprice",ch);
		mav.addObject("pro_list",pro_list);
		mav.setViewName("cart_order");
		return mav;
	}
	
	
	@RequestMapping(value = "/order_success", method = RequestMethod.POST)
	public ModelAndView orderSucess(OrderVO vo, String product_list) {
		ModelAndView mav = new ModelAndView();
		String ran = Integer.toString(new Random().nextInt(900000) + 100000);
		System.out.println(ran);
		int i = 0;
		String invo = Integer.toString(new Random().nextInt(900000000) + 100000000);
		
		
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
				
				ProductVO vo2 = service.getCartList(name);
				//임시
				vo2.setProduct_image(vo2.getProduct_image().split(",")[0]);
				pro_list.add(vo2);
			}	
		} 
		
		
		
		for(ProductVO product : pro_list) {
			String name = product.getProduct_name();
			String pid = product.getProduct_id();
			System.out.println(pid);
			vo.setProduct_name(name);
			vo.setProduct_id(pid);
			vo.setOrder_id(ran);
			vo.setOrder_invoice(invo);
			vo.setOrder_balance(1);
			orderservice.insertOrder(vo);
			
			System.out.println("=======확인" + i++);
		}
//		cart_pro_list.clear();
		System.out.println(vo.getOrder_seq());
//		OrderVO order = service.getorder(vo.getOrder_seq());
//		mav.addObject("vo", order);
		mav.setViewName("order_success");
		return mav;
	}
	
	//배송조회
	@RequestMapping(value = "/order_search", method = RequestMethod.GET )
	public String orderSearch() {

		return "order_search";
	}

}
