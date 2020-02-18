package com.spring.shop_main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop_project.ProductVO;

@Controller
public class MainController {
	
	@Autowired
	MainServiceImpl service;
	
	@RequestMapping(value = "/main", method={RequestMethod.GET,RequestMethod.POST} )
	public ModelAndView userMain(@RequestParam(value="menu", defaultValue = "goods") String menu) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", menu);
		mav.setViewName("main");
		return mav;
	}
  
  @RequestMapping(value = "/community_main", method = RequestMethod.GET )
	public ModelAndView commuMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("commu_main");
		return mav;
	}
  
  @RequestMapping(value = "/p_detail", method={RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView product_detail(@RequestParam(value="gid", required = false) String gid) {
		ModelAndView mav = new ModelAndView();
		ProductVO vo = service.getProductInfo(gid);
		System.out.println(vo.getProduct_id());
		mav.addObject("p_info", vo);
		mav.setViewName("p_detail");
		return mav;
	}
  
 

}
