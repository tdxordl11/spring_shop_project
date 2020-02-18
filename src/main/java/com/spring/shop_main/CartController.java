//package com.spring.shop_main;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//@SessionAttributes({"cart"})
//
//public class CartController {
//
//	  @RequestMapping(value = "/cart_order",  method = RequestMethod.GET )
//		public ModelAndView cart_order() {
//			ModelAndView mav = new ModelAndView();
//			mav.setViewName("cart_order");
//			return mav;
//		}
//	  
//	  @RequestMapping(value = "/cart_order", method = RequestMethod.POST)
//		public String cart_order(@ModelAttribute CartVO vo, Model model, HttpSession session, String g_num_modi) {
//		  model.addAttribute("num_modi", g_num_modi);
//		  session.setAttribute("o_info", vo);
//		  
//			return "cart_order";
//		}
//	  
//	  @RequestMapping(value = "/cart_order_process", method = RequestMethod.POST )
//		public String cart_order_process(@ModelAttribute CartVO vo, HttpSession session ) {
////		  cart.add(vo);
//		  
//			return "cart_order";
//		}
//	  

//	  
//}
