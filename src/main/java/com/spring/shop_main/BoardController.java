package com.spring.shop_main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop_project.AdminService;
import com.spring.shop_project.QnaVO;

@Controller
public class BoardController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("/user_qna")
	public ModelAndView qnaManage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnalist", service.adminQnaList());
		mav.setViewName("admin_qna");
		return mav;
	}
	
	// 1:1���� ��
		@RequestMapping("/user_qna_detail")
		public ModelAndView qnaaManageDetail(@RequestParam(value = "cs_seq") int seq) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("qnalist", service.getQnaDetail(seq));
			mav.setViewName("admin_qna_detail");
			return mav;
		}
		
		// 1:1���� �亯�ޱ�
		@RequestMapping("/user_qna_update")
		public void qnaManageUpdate(QnaVO vo, HttpServletRequest request, HttpServletResponse response) {
			PrintWriter out;
			
			try {
				response.setContentType("text/html; charset=UTF-8");
				int chk = service.qnaUpdate(vo);
				if(chk == 1) { // ���� ������Ʈ
					out = response.getWriter();
					out.println("<script>alert('�亯�� ��� �Ǿ����ϴ�'); opener.location.reload();window.close();</script>");	 
					out.flush();
				}
			} catch (IOException e) {
				e.getStackTrace();
			}

		}

}
