package com.spring.shop_project;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

//import com.spring.shop_main.CartVO;
import com.spring.shop_main.KakaoLoginAPI;
import com.spring.shop_main.MailService;
import com.spring.shop_main.NaverLoginAPI;


@Controller
public class UserController {
	  
	  @Autowired
	  UserService service;
	  @Autowired
	  private KakaoLoginAPI kakao;
	  @Autowired
	  private NaverLoginAPI naver;
	  
	  @Autowired
	  MailService sendmail;

//	  @RequestMapping(value = "/logintest", method = RequestMethod.GET)
//	  public String Login() {
//		  
//		  return "logintest";
//	  }
	  /**
	   * �α��� ȭ���� �ִ� ������ ��Ʈ��
	   * @param session
	   * @param model
	   * @return
	   * @throws UnsupportedEncodingException
	   * @throws UnknownHostException 
	   */
	  @RequestMapping("/user_login")
	  public String loginNaver(HttpSession session, Model model) {
	    String[] naverURL = naver.naverURL();
	    session.setAttribute("state", naverURL[0]);
	    model.addAttribute("naverURL", naverURL[1]);
	    return "logintest";
	  }
	  
	  @RequestMapping(value="/user_login", method = RequestMethod.POST)
	  public String loginResult(HttpSession session, Model model, UserVO vo) {
	    if(service.checkUser(vo)==1) {
//	    	System.out.println(vo.getUser_password());
	    	session.setAttribute("user_id", vo.getUser_id());
	    	UserVO user_name = service.userGetDetail(vo.getUser_id());
	    	session.setAttribute("user_name", user_name.getUser_name());
	    	System.out.println(session.getAttribute("user_name"));
	    	System.out.println("로그인 성공");
	    	return "redirect:/main";
	    }
	    return "redirect:/main?menu=user_login";
	  }
	  
	  @RequestMapping(value="userloginchk",  method = RequestMethod.POST, produces="application/json;charset=utf-8")
		@ResponseBody
		public String adminLoginCheck(UserVO vo) { 
			return "{\"check\" : \"" + service.checkUser(vo)  + "\"}";
		}
	  
	  @RequestMapping("/user_logout")
	  public String invalidateSession(HttpSession session) {
	    session.invalidate();
	    return "redirect:/main";
	  }
	  
	  @RequestMapping("/signup")
	  public ModelAndView memberSignUp() {
		  
		  ModelAndView mav = new ModelAndView();
		  int ran = new Random().nextInt(900000) + 100000;
		  mav.setViewName("member_signup");
		  mav.addObject("random", ran);
		  return mav;

//		  int ran = new Random().nextInt(900000) + 100000;
//		  HttpSession session = req.getSession(true);
//		  String authCode = String.valueOf(ran);
//		  session.setAttribute("authCode", authCode);
//		  session.setAttribute("random", random);
//		  String subject = "회원가입 인증 코드 발급 안내 입니다.";
//		  StringBuilder sb = new StringBuilder();
//		  sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
//
//		 
//	    return "member_signup";
	  }
	  
	  @RequestMapping(value = "/signup", method = RequestMethod.POST)
		public ModelAndView userSignUp(UserVO vo) {
			ModelAndView mav = new ModelAndView();
			
			int chk = service.userSignUp(vo);
			
			if ( chk == 1 ) {
				System.out.println("회원가입 완료"); 
			} else {
				System.out.println("회원가입 실패");
			}
			
			mav.addObject("checked", chk);
			mav.setViewName("redirect:/main");
			
			return mav;
		}
	  
	  @RequestMapping(value="/useridcheck",  method = RequestMethod.GET, produces="application/json;charset=utf-8")
		@ResponseBody
		public String adminIdCheck(String user_id) { // json ���·� �޾ƾ���
			return "{\"check\" : \"" + service.userIdCheck(user_id)  + "\"}";
		}

	  
	  @RequestMapping(value="/emailcheck", method=RequestMethod.GET)
	  @ResponseBody
	  public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random, HttpServletRequest req){
	  //이메일 인증
		  String sendid = "st.shop.final@gmail.com";
		  int ran = new Random().nextInt(900000) + 100000;
		  HttpSession session = req.getSession(true);
		  String authCode = String.valueOf(ran);
		  session.setAttribute("authCode", authCode);
		  session.setAttribute("random", random);
		  String subject = "회원가입 인증 코드 발급 안내 입니다.";
		  StringBuilder sb = new StringBuilder();
		  sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
	  return  sendmail.send(subject, sb.toString(), sendid, userEmail);
	  }
	  
	@RequestMapping(value = "/emailAuth", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random,
			HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		if (originalJoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}


	  /**
	   * �ݹ� ������ ��Ʈ�ѷ�
	   * @param session
	   * @param request
	   * @param model
	   * @return
	   */
	  @RequestMapping("/naver_callback")
	  public String naverCallback(HttpSession session, HttpServletRequest request, Model model) {
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    Map<String, Object> res = naver.getAccessToken(code, state);
	    if(res != null && !res.equals("")) {
	      model.addAttribute("res", res);
	      System.out.println(res);
		String accessToken = res.get("access_token").toString();
		HashMap<String, String> res2 = naver.getProfileFromNaver(accessToken);
	      session.setAttribute("user_id", res2.get("id"));
	      session.setAttribute("user_name", res2.get("name"));
//	      session.setAttribute("currentAT", res.get("access_token"));
//	      session.setAttribute("currentRT", res.get("refresh_token"));
	    } else {
	      model.addAttribute("res", "Login failed!");
	    }
	    return "test-naver-callback";
	  }
	  /**
	   * ��ū ���� ��û ������ ��Ʈ�ѷ�
	   * @param session
	   * @param request
	   * @param model
	   * @param refreshToken
	   * @return
	   */
	  @RequestMapping("/refreshToken")
	  public String refreshToken(HttpSession session, HttpServletRequest request, Model model, String refreshToken) {
	    String res = naver.refreshToken(refreshToken);
	    model.addAttribute("res", res);
	    session.invalidate();
	    return "test-naver-callback";
	  }
	  /**
	   * ��ū ���� ��Ʈ�ѷ�
	   * @param session
	   * @param request
	   * @param model
	   * @param accessToken
	   * @return
	   */
	  @RequestMapping("/deleteToken")
	  public String deleteToken(HttpSession session, HttpServletRequest request, Model model, String accessToken) {
	    String res = naver.deleteToken(accessToken);
	    model.addAttribute("res", res);
	    session.invalidate();
	    return "test-naver-callback";
	  }
	  /**
	   * �׼��� ��ū���� ���̹����� ������ �ޱ�
	   * @param accessToken
	   * @return
	   */
	//  @ResponseBody
	  @RequestMapping("/getProfile")
	  public String getProfileFromNaver(String accessToken) {
	    // ���̹� ������ ����;
	    	HashMap<String, String> userInfo = naver.getProfileFromNaver(accessToken);
	    	System.out.println(userInfo.get("name"));
//			service.insertUser(userInfo);
			return "main";
	  }
	 
	  
	  
	  @RequestMapping(value="/kakao_login")
	  public String login(@RequestParam("code") String code, HttpSession session) throws ParseException {
		  String access_Token = kakao.getAccessToken(code);
		  System.out.println("controller access_token : " + access_Token);
		  HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		    System.out.println("login Controller : " + userInfo);
		    session.setAttribute("user_id", userInfo.get("kakaoId"));
		    session.setAttribute("user_name", userInfo.get("nickname"));
		    System.out.println("카카오 아이디 = " + userInfo.get("kakaoId"));
		    int check = service.apiIdCheck((String) userInfo.get("kakaoId"));
		    System.out.println(check);
		    if(check == 1) {
		    	session.setAttribute("cktoken", check);
		    }
		   //    Ŭ���̾�Ʈ�� �̸����� ������ �� ���ǿ� �ش� �̸��ϰ� ��ū ���
		    if (userInfo.get("email") != null) {
		        session.setAttribute("useremail", userInfo.get("email"));
		        session.setAttribute("access_Token", access_Token);
		        System.out.println("카카오 이메일 = " + userInfo.get("email"));
		    }
	      return "test-naver-callback";
	  }
	  
	  @RequestMapping(value="/kakao_logout")
	  public String logout(HttpSession session) {
	      kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	      session.removeAttribute("access_Token");
	      session.removeAttribute("kakaoId");
	      session.removeAttribute("cktoken");
	      session.removeAttribute("useremail");
	      return "redirect:/main";
	  }
	  
	  @RequestMapping(value="/kakao_unlink")
	  public String unlink(HttpSession session) {
	      kakao.kakaoUnlink((String)session.getAttribute("access_Token"));
	      session.removeAttribute("access_Token");
	      session.removeAttribute("kakaoId");
	      session.removeAttribute("useremail");
	      session.removeAttribute("cktoken");
	      return "redirect:/main";
	  }
	  
	  @RequestMapping(value="/kakao_pay")
	  public String readypay(HttpSession session, Model model) {
	      String name = "헤드폰";
	      int num = 2;
	      int price = 43000;
		  String url = kakao.getReadyPay(name, num, price);
	      model.addAttribute("url", url);
	      return "kakaopay";
	  }
	  
	  @RequestMapping(value="/kakao_pay_success")
	  public String successpay(HttpSession session, Model model, String pg_token) {
	      String resbody = kakao.getReadyPaySucess(pg_token);
//	      model.addAttribute("url", url);
	      return "pay_success";
	  }
	  
	  @RequestMapping(value="/kakao_pay_cancel")
	  public String cancelpay(HttpServletResponse response) {
		  PrintWriter out;
		  try {
			out = response.getWriter();
			out.println("<script> self.close();</script>");	 
			out.flush(); //alert('결제를 취소 하셨습니다.');
		} catch (IOException e) {
			e.printStackTrace();
		}
	      return "kakaopay_cancel";
	  }

//	  @RequestMapping(value = "/main", method={RequestMethod.GET,RequestMethod.POST} )
//		public ModelAndView userMain(@RequestParam(value="menu", defaultValue = "goods") String menu) {
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("menu", menu);
//			mav.setViewName("main");
//			return mav;
//		}
//	  
//	  @RequestMapping(value = "/community_main", method = RequestMethod.GET )
//		public ModelAndView commuMain() {
//			ModelAndView mav = new ModelAndView();
//			mav.setViewName("commu_main");
//			return mav;
//		}
//	  
//	  @RequestMapping(value = "/p_detail", method={RequestMethod.GET,RequestMethod.POST} )
//		public ModelAndView product_detail(@RequestParam(value="gid", required = false) String gid) {
//			ModelAndView mav = new ModelAndView();
//			List<ProductVO> vo = service.pagingOrder(gid);
//			mav.setViewName("p_detail");
//			return mav;
//		}
	  
	  // user 정보 list 보여주기
	  @RequestMapping("/admin/user_manage")
	  public ModelAndView userManage() {
			ModelAndView mav = new ModelAndView();
			mav.addObject("userlist", service.userGetList());
			mav.setViewName("user_manage");
			return mav;
		}

	  //사용자 detail
	  @RequestMapping("/admin/user_manage_detail")
		public ModelAndView userManageDetail(@RequestParam(value = "user") String user) {
			ModelAndView mav = new ModelAndView();
		    UserVO vo = service.userGetDetail(user);
		    mav.addObject("userdetail",vo);
			mav.setViewName("user_manage_detail");
			return mav;
		}
	  
	  // 사용자 detail 수정
	  @RequestMapping(value = "/admin/user_manage_update" , method = RequestMethod.POST)
		public void adminManageDetail(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
			
			SessionVO sessionVO = (SessionVO)session.getAttribute("session");
			PrintWriter out;
			
			int level = Integer.parseInt(sessionVO.getAuthlevel());
				
				if(level >= 1) {
					service.userUpdate(vo);
					response.setContentType("text/html; charset=UTF-8");
					try {
						out = response.getWriter();
						out.println("<script>alert('수정 되었습니다'); location.href='"+request.getContextPath()+"/admin/main?menu=user_manage'</script>");	 
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
				 //실패시
					response.setContentType("text/html; charset=UTF-8");
					try {
						out = response.getWriter();
						out.println("<script>alert('권한이 없습니다.'); location.href='"+request.getContextPath()+"/admin/main?menu=user_manage'</script>");	 
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
			}
		
		}
	  
	  // 사용자 계정 삭제 
	  @RequestMapping(value="/admin/userdelete")
		public void UserDelete(@RequestParam(value="user") String user, HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		  
		  SessionVO sessionVO = (SessionVO)session.getAttribute("session");
			PrintWriter out;
			
			int level = Integer.parseInt(sessionVO.getAuthlevel());
				
				if(level >= 1) {
					service.csDelete(user);
				  	service.reviewDelete(user);
				  	service.auctionDelete(user);
				  	service.discountDelete(user);
				  	service.group_purchaseDelete(user);
				  	service.shoporderDelete(user);
					service.userDelete(user);
					response.setContentType("text/html; charset=UTF-8");
					try {
						out = response.getWriter();
						out.println("<script>alert('삭제 되었습니다'); location.href='"+request.getContextPath()+"/admin/main?menu=user_manage'</script>");	 
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
				 //실패시
					response.setContentType("text/html; charset=UTF-8");
					try {
						out = response.getWriter();
						out.println("<script>alert('권한이 없습니다.'); location.href='"+request.getContextPath()+"/admin/main?menu=user_manage'</script>");	 
						out.flush();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
			}
			
		}
	  
	  
	  // 지출액이 높은 사람은 회원등급을 높여줘보자
//	  @RequestMapping(value="/viptop3")
//	  public ModelAndView vipgrade() {
//		List<OrderVO> viptop3 = service.vipgrade();
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("viptop3", viptop3);
//		mav.setViewName("/user_manage");
//		
//		return mav;
//	  }

	
}
