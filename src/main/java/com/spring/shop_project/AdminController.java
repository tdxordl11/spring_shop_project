package com.spring.shop_project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
	AdminServiceImpl service;
	
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET )
	public ModelAndView adminMain(@RequestParam(value="menu", defaultValue = "admin_manage") String menu) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", menu);
		mav.setViewName("admin_main");
		return mav;
	}
	
	@RequestMapping(value = "/admin/login", method = RequestMethod.GET )
	public ModelAndView adminLogin(@RequestParam(value="checked", defaultValue="0") int checked) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("checked", checked);
		mav.setViewName("admin_login");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST )
	public ModelAndView adminLogin(AdminVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
	
		//boolean chk = service.otpCheck(vo);
		
		boolean chk=true;
		
		if(chk == false) {
			mav.addObject("checked", 2);
			mav.setViewName("/admin_login");
		} else {
			SessionVO sessionVO = new SessionVO();
			sessionVO.setId(vo.getAdmin_id());
			//sessionVO.setAuthlevel(vo.getAdmin_authlevel());
			session.setAttribute("session", sessionVO);
			mav.setViewName("redirect:/admin/main");
		} 
		
		return mav;
	}
	
	@RequestMapping(value="/admin/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login";
    }
	
	@RequestMapping(value = "/admin/signup", method = RequestMethod.GET)
	public ModelAndView adminSignUpForm() {
		ModelAndView mav = new ModelAndView();
		GoogleOTPService otp = new GoogleOTPService();
		String otpkey = otp.generate();
		
		mav.addObject("otpkey", otpkey);
		mav.setViewName("/admin_signup");

		return mav;
	}
	
	@RequestMapping(value = "/admin/signup", method = RequestMethod.POST)
	public ModelAndView adminSignUp(AdminVO vo) {
		ModelAndView mav = new ModelAndView();
		
		int chk = service.adminSignUp(vo);
		
		if ( chk == 1 ) {
			System.out.println("정상 등록됨"); 
		} else {
			System.out.println("등록 에러");
		}
		
		mav.addObject("checked", chk);
		mav.setViewName("/admin_login");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/otpqrGen",  method = RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public String adminOtpQRGen(String admin_id, String admin_address, String admin_otpkey) {
		GoogleOTPService otp = new GoogleOTPService();
		//200x200
		return "{\"qrcode\" : \"" + otp.getQRBarcodeURL(admin_id, admin_address, admin_otpkey) + "\"}";
	}
	
	@RequestMapping(value="/admin/adminidcheck",  method = RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public String adminIdCheck(String admin_id) { // json 형태로 받아야함
		return "{\"check\" : \"" + service.adminIdCheck(admin_id)  + "\"}";
	}
	
	@RequestMapping(value="/admin/loginchk",  method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String adminLoginCheck(AdminVO vo) { 
		return "{\"check\" : \"" + service.adminLogin(vo)  + "\"}";
	}
	
	
	//관리자 관리
	@RequestMapping("/admin/admin_manage")
	public ModelAndView adminManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist", service.adminGetList());
		mav.setViewName("admin_manage");
		return mav;
	}
	
	//1:1 문의 관리
		@RequestMapping("/admin/admin_qna")
		public ModelAndView qnaManage() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("adminlist", service.adminGetList());
			mav.setViewName("admin_qna");
			return mav;
		}
		
	//이용후기 관리
	@RequestMapping("/admin/admin_review" )
	public ModelAndView reviewManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewlist", service.getReviewList());
		mav.setViewName("admin_review");
		return mav;
	}
	/*
	 * //이용후기 디테일 admin_review_detail
	 * 
	 * @RequestMapping("/admin/admin_review") public ModelAndView
	 * reviewManageDetail(@RequestParam (value = "review_seq") int seq) {
	 * ModelAndView mav = new ModelAndView(); //mav.addObject("reviewlist",
	 * service.getReviewDetail()); mav.setViewName("admin_review_detail"); return
	 * mav; }
	 */
	
	//공지사항 관리
	@RequestMapping("/admin/admin_notice")
	public ModelAndView noticeManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist", service.adminGetList());
		mav.setViewName("admin_notice");
		return mav;
	}
	
	//쿠폰 관리
	@RequestMapping("/admin/admin_discount")
	public ModelAndView discountManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist", service.adminGetList());
		mav.setViewName("admin_discount");
		return mav;
	}
	
	
}
