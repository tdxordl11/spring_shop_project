package com.spring.shop_project;

import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	  @RequestMapping("/login")
	  public String loginNaver(HttpSession session, Model model) {
	    String[] naverURL = naver.naverURL();
	    session.setAttribute("state", naverURL[0]);
	    model.addAttribute("naverURL", naverURL[1]);
	    return "logintest";
	  }
	  
	  @RequestMapping(value="/login", method = RequestMethod.POST)
	  public String loginResult(HttpSession session, Model model, UserVO vo) {
	    if(service.checkUser(vo)==1) {
	    	System.out.println(vo.getUser_password());
	    	session.setAttribute("user_id", vo.getUser_id());
	    	return "main";
	    }else if(service.checkUser(vo)==0) {
	    	System.out.println("로그인 안됨");
	    	model.addAttribute("login", "아이디 혹은 비밀번호를 확인해주세요.");
	    }
	    return "logintest";
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
			mav.setViewName("/admin_login");
			
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
	      session.setAttribute("currentUser", res2.get("name"));
	      session.setAttribute("currentAT", res.get("access_token"));
	      session.setAttribute("currentRT", res.get("refresh_token"));
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
			return "logintest";
	  }
	  /**
	   * ���� ��ȿȭ(�α׾ƿ�)
	   * @param session
	   * @return
	   */
	  @RequestMapping("/invalidate")
	  public String invalidateSession(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	  }
	  
	  @RequestMapping(value="/kakao_login")
	  public String login(@RequestParam("code") String code, HttpSession session) throws ParseException {
		  String access_Token = kakao.getAccessToken(code);
		  System.out.println("controller access_token : " + access_Token);
		  HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		    System.out.println("login Controller : " + userInfo);
	      
		   //    Ŭ���̾�Ʈ�� �̸����� ������ �� ���ǿ� �ش� �̸��ϰ� ��ū ���
		    if (userInfo.get("email") != null) {
		        session.setAttribute("userId", userInfo.get("email"));
		        session.setAttribute("access_Token", access_Token);
		    }
	      return "test-naver-callback";
	  }
	  
	  @RequestMapping(value="/kakao_logout")
	  public String logout(HttpSession session) {
	      kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	      session.removeAttribute("access_Token");
	      session.removeAttribute("userId");
	      return "redirect:/login";
	  }
	  
	  @RequestMapping(value="/kakao_unlink")
	  public String unlink(HttpSession session) {
	      kakao.kakaoUnlink((String)session.getAttribute("access_Token"));
	      session.removeAttribute("access_Token");
	      session.removeAttribute("userId");
	      return "redirect:/login";
	  }
	  
	  @RequestMapping(value="/kakao_pay")
	  public String readypay(HttpSession session, Model model) {
	      String url = kakao.getReadyPay((String)session.getAttribute("access_Token"));
	      model.addAttribute("url", url);
	      return "kakaopay";
	  }
	  
	  @RequestMapping(value="/kakao_pay_success")
	  public String successpay(HttpSession session, Model model, String pg_token) {
	      String resbody = kakao.getReadyPaySucess((String)session.getAttribute("access_Token"), pg_token);
//	      model.addAttribute("url", url);
	      return "pay_success";
	  }

	  @RequestMapping(value="/imsi")
	  public String logout11(HttpSession session) {
	      return "main";
	  }
	
}
