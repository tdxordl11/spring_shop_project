package com.spring.shop_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class OrderController {
	@Autowired
	OrderService service;
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public ModelAndView pagingList(/*@RequestParam(value="pagenum", required = false, defaultValue="1") int pagenum*/) {
		ModelAndView mav = new ModelAndView();
		int param[] = new int[2]; 
//		param[0] = ((pagenum-1) * 10) + 1;
//		param[1] = pagenum * 10;
//		int max = service.getMaxCount();
//		max = max/10;
//		if(max % 10 != 0) {
//			max++;
//		}
//		mav.addObject("max", max);
		mav.addObject("orderlist", service.pagingOrder(param));
		mav.setViewName("amind_orderlist");
		
		return mav;
	}
	
	@RequestMapping(value="/orderdetail", method = RequestMethod.GET)
	public ModelAndView getOrderDetail(@RequestParam int seq) {
		service.updateViews(seq);
		ModelAndView mav = new ModelAndView();
		OrderVO vo = service.getOrderdetail(seq);
		mav.addObject("orderdetail", vo);
		mav.setViewName("orderdetail");

		return mav;
	}
	
	@RequestMapping(value="/production", method = RequestMethod.GET)
	public String production() {

		return "";
	}
	
	
	@RequestMapping("/admin/admin_orderlist")
	public ModelAndView orderList(@RequestParam(value="pagenum", required = false, defaultValue="1") int pagenum) {
		ModelAndView mav = new ModelAndView();
		int param[] = new int[2]; 
		param[0] = ((pagenum-1) * 10) + 1;
		param[1] = pagenum * 10;
		mav.addObject("orderlist", service.pagingOrder(param));
		mav.setViewName("admin_orderlist");
		return mav;
	}
	
//	@RequestMapping("/admin/admin_orderlist")
//	public String toOrderList() {
//
//		return "redirect:/admin/main?menu=admin_orderlist";
//	}
	
}
