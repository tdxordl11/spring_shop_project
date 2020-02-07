package com.spring.shop_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.ParseException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {
	  
	  @Autowired
	  UserService service;
	  @Autowired
	  private KakaoLoginAPI kakao;
	  @Autowired
	  private NaverLoginAPI naver;

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
	  public String loginNaverResult(HttpSession session, Model model, UserVO vo) {
	    if(service.checkUser(vo)==1) {
	    	System.out.println(vo.getUser_password());
	    	session.setAttribute("user_id", vo.getUser_id());
	    	model.addAttribute("login", vo);
	    	return "main";
	    }else if(service.checkUser(vo)==0) {
	    	System.out.println("���̵����");
	    }else if(service.checkUser(vo)==2) {
	    	System.out.println("���Ʋ��");
	    }
	    return "logintest";
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
	      return "logintest";
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

	
}
