package com.spring.shop_main;

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
	public ModelAndView adminMain(
			@RequestParam(value = "sort", defaultValue = "none") String sort,
			@RequestParam(value = "curPage", defaultValue = "1") String curPage,
			@RequestParam(value = "pageListSize", defaultValue = "16") String pageListSize
			) {
		ModelAndView mav = new ModelAndView();
		
		
		if(sort.equals("none")) {
			mav.addObject("goodslist",service.getGoodsList(curPage,pageListSize));
		} else {
			mav.addObject("goodslist",service.getGoodsListSort(curPage,pageListSize, sort));
		}
		
		mav.setViewName("goods_list");
		return mav;
	}
	
	@RequestMapping(value = "/goodsScroll", method = RequestMethod.GET )
	@ResponseBody
	public List<ProductVO> adminMaintmp(
			@RequestParam(value = "sort", defaultValue = "none") String sort,
			@RequestParam(value = "curPage") String curPage,
			@RequestParam(value = "pageListSize") String pageListSize
			) {
		ModelAndView mav = new ModelAndView();
		List<ProductVO> vo;
		
		if(sort.equals("none")) {
			vo = (List<ProductVO>) service.getGoodsList(curPage,pageListSize);
		} else {
			vo = (List<ProductVO>) service.getGoodsListSort(curPage,pageListSize,sort);
		}
		
		return vo;
	}
}
