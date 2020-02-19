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
	public ModelAndView adminMain(@RequestParam(value="menu", defaultValue = "admin_chart") String menu) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("menu", menu);
		mav.setViewName("admin_main");
		return mav;
	}
	
	@RequestMapping(value = "/admin/main", method = RequestMethod.POST )
	public ModelAndView adminMainPost(@RequestParam(value="menu", defaultValue = "admin_chart") String menu) {
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
	
		boolean chk = service.otpCheck(vo);
		
//		boolean chk = true;
		
		if(chk == false) {
			mav.addObject("checked", 2);
			mav.setViewName("/admin_login");
		} else {
			SessionVO sessionVO = new SessionVO();
			sessionVO.setId(vo.getAdmin_id());
			
			AdminVO chkvo = service.adminUserAuthCheck(vo.getAdmin_id());
			
			sessionVO.setAuthlevel(chkvo.getAdmin_authlevel());
			sessionVO.setAdmin_active(chkvo.getAdmin_active());
			
			// ��Ȱ��ȭ�� ������ ���
			if(chkvo.getAdmin_active()==0) {
				mav.addObject("checked",3);
				mav.setViewName("/admin_login");
			} else {
				session.setAttribute("session", sessionVO);
				//mav.addObject("chkvo", chkvo );
				mav.setViewName("redirect:/admin/main");
				
			}
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
			System.out.println("���� ��ϵ�"); 
		} else {
			System.out.println("��� ����");
		}
		
		mav.addObject("checked", chk);
		mav.setViewName("/admin_login");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/otpGen",  method = RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public String adminOtpReGen() {
		GoogleOTPService otp = new GoogleOTPService();
		String otpkey = otp.generate();
		return "{\"otpkey\" : \"" + otpkey + "\"}";
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
	public String adminIdCheck(String admin_id) { // json ���·� �޾ƾ���
		return "{\"check\" : \"" + service.adminIdCheck(admin_id)  + "\"}";
	}
	
	@RequestMapping(value="/admin/loginchk",  method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String adminLoginCheck(AdminVO vo) { 
		return "{\"check\" : \"" + service.adminLogin(vo)  + "\"}";
	}
	
	
	//������ ����
	@RequestMapping("/admin/admin_manage")
	public ModelAndView adminManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist", service.adminGetList());
		mav.setViewName("admin_manage");
		return mav;
	}
	
	//������ ������ 
	@RequestMapping("/admin/admin_manage_detail")
	public ModelAndView adminManageDetail(@RequestParam(value = "user") String user) {
		ModelAndView mav = new ModelAndView();
	    AdminVO vo = service.adminGetDetail(user);
	    mav.addObject("admindetail",vo);
		mav.setViewName("admin_manage_detail");
		return mav;
	}

		
	//������ ���� ������Ʈ
	@RequestMapping(value = "/admin/admin_manage_update" , method = RequestMethod.POST)
	public void adminManageDetail(AdminVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	    //AdminVO vo = service.adminGetDetail(user);
		
		SessionVO sessionVO = (SessionVO)session.getAttribute("session");
		PrintWriter out;
		
		int level = Integer.parseInt(sessionVO.getAuthlevel());
			//int level = Integer.parseInt(service.authlevelchk(vo));
			if(level == 2) {
				service.adminUpdate(vo);
				response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					out.println("<script>alert('수정 완료되었습니다'); location.href='"+request.getContextPath()+"/admin/main?menu=admin_manage'</script>");	 
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
			 //���н�
				response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					out.println("<script>alert('권한이 없습니다'); location.href='"+request.getContextPath()+"/admin/main?menu=admin_manage'</script>");	 
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		}
	
	}
	
		
	// 1:1 ���� ����
	@RequestMapping("/admin/admin_qna")
	public ModelAndView qnaManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnalist", service.adminQnaList());
		mav.setViewName("admin_qna");
		return mav;
	}
	
	// 1:1���� ��
	@RequestMapping("/admin/admin_qna_detail")
	public ModelAndView qnaaManageDetail(@RequestParam(value = "cs_seq") int seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnalist", service.getQnaDetail(seq));
		mav.setViewName("admin_qna_detail");
		return mav;
	}
	
	// 1:1���� �亯�ޱ�
	@RequestMapping("/admin/admin_qna_update")
	public void qnaManageUpdate(QnaVO vo, HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			int chk = service.qnaUpdate(vo);
			if(chk == 1) { // ���� ������Ʈ
				out = response.getWriter();
				out.println("<script>alert('답변이 등록 되었습니다'); opener.location.reload();window.close();</script>");	 
				out.flush();
			}
		} catch (IOException e) {
			e.getStackTrace();
		}

	}

	// �̿��ı� ����
	@RequestMapping("/admin/admin_review")
	public ModelAndView reviewManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewlist", service.getReviewList());
		mav.setViewName("admin_review");
		return mav;
	}

	// �̿��ı� ������ admin_review_detail
	@RequestMapping(value = "/admin/admin_review_detail", method = RequestMethod.GET)
	public ModelAndView reviewManageDetail(@RequestParam(value = "review_seq") int seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewdetail", service.getReviewDetail(seq));
		mav.setViewName("admin_review_detail");
		return mav;
	}

	// �������� ����
	@RequestMapping("/admin/admin_notice")
	public ModelAndView noticeManage() {
		//write, update �� refresh �ǵ���....
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticelist", service.noticeGetList());
		mav.setViewName("admin_notice");
		return mav;
	}

	// �������� ������
	@RequestMapping(value = "/admin/admin_notice_detail", method = RequestMethod.GET)
	public ModelAndView noticeManageDetail(@RequestParam(value = "notice_seq") int seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticedetail", service.getNoticeDetail(seq));
		mav.setViewName("admin_notice_detail");
		return mav;
	}
	
	//�������� �ۼ� view
	@RequestMapping(value = "/admin/admin_notice_write", method = RequestMethod.GET)
	public String noticeWriteView() {
		return "admin_notice_write";
	}
	
	// �������� �ۼ�
	@RequestMapping(value = "/admin/admin_notice_write", method = RequestMethod.POST)
	public void noticeWrite(NoticeVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
		NoticeVO ntvo = vo;
		//���ǿ��� �ۼ��ڸ� ������
		SessionVO sessionVO = (SessionVO)session.getAttribute("session");
		ntvo.setAdmin_id(sessionVO.getId());
		
		int chk = service.noticeWrite(vo); // 1: ������ 	
		PrintWriter out;
		if(chk==1){
			//���� ��
			response.setContentType("text/html; charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('작성 완료되었습니다'); opener.location.reload();window.close();</script>");	 
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
        } else {
        	//���� ��
        }
	}
	
	// �������� ����
		@RequestMapping(value = "/admin/admin_notice_update", method = RequestMethod.POST)
		public void noticeUpdate(NoticeVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	
			//���ǿ��� �ۼ��ڸ� ������
			SessionVO sessionVO = (SessionVO)session.getAttribute("session");
			PrintWriter out;
			if(sessionVO.getId().equals(vo.getAdmin_id())){
				//�ۼ��ڿ� �����ڰ� ��ġ�ϴ� ���
				try {
					response.setContentType("text/html; charset=UTF-8");
					int chk = service.noticeUpdate(vo);
					if(chk == 1) { // ���� ������Ʈ
						out = response.getWriter();
						out.println("<script>alert('수정 완료되었습니다'); opener.location.reload();window.close();</script>");	 
						out.flush();
					} else {
						//���н�
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
	        } else {
	        	//�ۼ��ڿ� �����ڰ� ��ġ���� �ʴ� ���
	        	response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					out.println("<script>alert('타 사용자의 게시물은 수정이 불가합니다.); self.close();</script>");	 
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
		}

	
	
	// ���� ���� ( ���� )
	@RequestMapping("/admin/admin_discount")
	public ModelAndView discountManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminlist", service.adminGetList());
		mav.setViewName("admin_discount");
		return mav;
	}
	
	// ���
		@RequestMapping(value = "/admin/admin_chart", method = RequestMethod.GET)
		public ModelAndView chart_view() {
			ModelAndView mav = new ModelAndView();
			//mav.addObject("noticedetail", service.getNoticeDetail(seq));
			mav.setViewName("admin_chart");
			return mav;
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

}
