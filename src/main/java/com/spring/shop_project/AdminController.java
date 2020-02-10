package com.spring.shop_project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		boolean chk = true;
		
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

	// 1:1 문의 관리
	@RequestMapping("/admin/admin_qna")
	public ModelAndView qnaManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnalist", service.adminQnaList());
		mav.setViewName("admin_qna");
		return mav;
	}

	// 이용후기 관리
	@RequestMapping("/admin/admin_review")
	public ModelAndView reviewManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewlist", service.getReviewList());
		mav.setViewName("admin_review");
		return mav;
	}

	// 이용후기 디테일 admin_review_detail
	@RequestMapping(value = "/admin/admin_review_detail", method = RequestMethod.GET)
	public ModelAndView reviewManageDetail(@RequestParam(value = "review_seq") int seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewdetail", service.getReviewDetail(seq));
		mav.setViewName("admin_review_detail");
		return mav;
	}

	// 공지사항 관리
	@RequestMapping("/admin/admin_notice")
	public ModelAndView noticeManage() {
		//write, update 시 refresh 되도록....
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticelist", service.noticeGetList());
		mav.setViewName("admin_notice");
		return mav;
	}

	// 공지사항 디테일
	@RequestMapping(value = "/admin/admin_notice_detail", method = RequestMethod.GET)
	public ModelAndView noticeManageDetail(@RequestParam(value = "notice_seq") int seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticedetail", service.getNoticeDetail(seq));
		mav.setViewName("admin_notice_detail");
		return mav;
	}
	
	//공지사항 작성 view
	@RequestMapping(value = "/admin/admin_notice_write", method = RequestMethod.GET)
	public String noticeWriteView() {
		return "admin_notice_write";
	}
	
	// 공지사항 작성
	@RequestMapping(value = "/admin/admin_notice_write", method = RequestMethod.POST)
	public void noticeWrite(NoticeVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
		NoticeVO ntvo = vo;
		//세션에서 작성자명 가져옴
		SessionVO sessionVO = (SessionVO)session.getAttribute("session");
		ntvo.setAdmin_id(sessionVO.getId());
		
		int chk = service.noticeWrite(vo); // 1: 정상등록 	
		PrintWriter out;
		if(chk==1){
			//성공 시
			response.setContentType("text/html; charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('등록 되었습니다'); opener.location.reload();window.close();</script>");	 
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
        } else {
        	//실패 시
        }
	}
	
	// 공지사항 수정
		@RequestMapping(value = "/admin/admin_notice_update", method = RequestMethod.POST)
		public void noticeUpdate(NoticeVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
			//세션에서 작성자명 가져옴
			SessionVO sessionVO = (SessionVO)session.getAttribute("session");
			PrintWriter out;
			if(sessionVO.getId().equals(vo.getAdmin_id())){
				//작성자와 수정자가 일치하는 경우
				try {
					response.setContentType("text/html; charset=UTF-8");
					int chk = service.noticeUpdate(vo);
					if(chk == 1) { // 정상 업데이트
						out = response.getWriter();
						out.println("<script>alert('수정 되었습니다'); opener.location.reload();window.close();</script>");	 
						out.flush();
					} else {
						//실패시
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
	        } else {
	        	//작성자와 수정자가 일치하지 않는 경우
	        	response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					out.println("<script>alert('타 사용자의 게시물은 수정이 불가합니다.'); self.close();</script>");	 
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
		}

	
	
	// 쿠폰 관리 ( 미정 )
	@RequestMapping("/admin/admin_discount")
	public ModelAndView discountManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist", service.adminGetList());
		mav.setViewName("admin_discount");
		return mav;
	}

}
