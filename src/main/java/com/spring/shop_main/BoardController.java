package com.spring.shop_main;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop_project.AdminService;
import com.spring.shop_project.QnaVO;

@Controller
public class BoardController {
	
	@Autowired
	AdminService service;
	@Autowired
	ClientService service2;
	
	@RequestMapping("/user_qna")
	public ModelAndView qnaManage() {
		ModelAndView mav = new ModelAndView();
		
		//내 문의 게시판
		//mav.addObject("qnalist", service.userQnaList(id));
		
		//문의 게시판
		mav.addObject("qnalist", service.adminQnaList());
		
		mav.setViewName("qna");
		return mav;
	}
	
	//문의 게시글 작성 뷰
	@RequestMapping("/user_qna_write") 
	 public String qnaManageWrite() {
		
		return "qna_write";
	}
	
	//게시글 등록
	@RequestMapping(value="/user_qna_write", method = RequestMethod.POST) 
	 public void qnaManageWrite(QnaVO vo, HttpServletResponse response, HttpServletRequest request) {
		
		//게시물 등록 서비스
		int chk = service2.insertQna(vo);
		PrintWriter out;
		
		if(chk == 1) {
			response.setContentType("text/html; charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('정상적으로 등록되었습니다'); location.href='"+request.getContextPath()+"/main?menu=user_qna'</script>");	 
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('등록에 실패하였습니다.'); location.href='"+request.getContextPath()+"/main?menu=user_qna'</script>");	 
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//게시물 보기
	@RequestMapping("/user_qna_detail")
	public ModelAndView qnaaManageDetail(@RequestParam(value = "cs_seq") int seq, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		QnaVO vo = service.getQnaDetail(seq);
		
		session = request.getSession();
		
		System.out.println(session.getAttribute("user_name")+":"+vo.getUser_id());
		

		if(vo.getUser_id().equals(session.getAttribute("user_name"))) {
			mav.addObject("qnalist", vo);
			mav.setViewName("qna_detail");
		} else {
			mav.addObject("chk",-1);
			mav.addObject("qnalist", service.adminQnaList());
			mav.setViewName("qna");
		}
			
		return mav;
	}
		

	 @RequestMapping("/user_qna_update") 
	 public void qnaManageUpdate(QnaVO vo, HttpServletRequest request, HttpServletResponse response) { PrintWriter out;
		try {
			response.setContentType("text/html; charset=UTF-8");
			int chk = service.qnaUpdate(vo);
			if (chk == 1) { // ���� ������Ʈ out =
			out=response.getWriter();
			out.println("<script>alert('�亯�� ��� �Ǿ����ϴ�'); " + "opener.location.reload();window.close();</script>");
			out.flush();
			}
		} catch (IOException e) {
			e.getStackTrace();
		}

	}
	 

}
