package com.spring.shop_project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class NaverLoginAPI {
	  
	String CLIENT_ID = "2YhMeGgLvT4bEzZiZHO_";  //naver api id key
	String CLI_SECRET = "aUY9RLxRRy";  //naver apir secret key
	String redirectURI = "http://localhost:8084/shop_project/naver_callback";
	
	public String[] naverURL() {
		String redirectURI = "http://localhost:8084/shop_project/naver_callback";
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String naverURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    naverURL += String.format("&client_id=%s&redirect_uri=%s&state=%s",
	        CLIENT_ID, redirectURI, state);
	    String[] res = {state, naverURL};
	    return res;
	}
	
	  public Map<String, Object> getAccessToken (String code, String state) {
		  	String apiURL;  
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + CLIENT_ID;
		    apiURL += "&client_secret=" + CLI_SECRET;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    System.out.println("apiURL=" + apiURL);
		    String res = requestToServer(apiURL);
		    Map<String, Object> userInfo = null;
			try {
				userInfo = new JSONParser(res).parseObject();
			} catch (ParseException e) {
				e.printStackTrace();
			}
//			String accessToken = userInfo.get("access_token").toString();
			
	        return userInfo;
	    }
	  
	 public String naverCallback(String code, String state) {
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + CLIENT_ID;
		    apiURL += "&client_secret=" + CLI_SECRET;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    System.out.println("apiURL=" + apiURL);
		    String res = requestToServer(apiURL);
			
		    	return res;
		  }
	 
	
	public HashMap<String, String> getProfileFromNaver(String accessToken) {
		// 네이버 로그인 접근 토큰
	    String apiURL = "https://openapi.naver.com/v1/nid/me";
	    String headerStr = "Bearer " + accessToken; // Bearer �떎�쓬�뿉 怨듬갚 異붽�
	    String res = StringEscapeUtils.unescapeJava(requestToServer(apiURL, headerStr));
	    System.out.println(res);
	    	JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(res);
	    	JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
	        
	    	String email = response.getAsJsonObject().get("email").getAsString();
	        String name = response.getAsJsonObject().get("name").getAsString();
	    	HashMap<String, String> userInfo = new HashMap<String, String>();
	    	userInfo.put("email", email);
	    	userInfo.put("name", name);
			return userInfo;
	  }
		
    	public String refreshToken(String refreshToken) {
    	    String apiURL;
    	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&";
    	    apiURL += "client_id=" + CLIENT_ID;
    	    apiURL += "&client_secret=" + CLI_SECRET;
    	    apiURL += "&refresh_token=" + refreshToken;
    	    System.out.println("apiURL=" + apiURL);
    	    String res = requestToServer(apiURL);
    	    return res;
    	  }
    	
    	
    	 public String deleteToken(String accessToken) {
    		    String apiURL;
    		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
    		    apiURL += "client_id=" + CLIENT_ID;
    		    apiURL += "&client_secret=" + CLI_SECRET;
    		    apiURL += "&access_token=" + accessToken;
    		    apiURL += "&service_provider=NAVER";
    		    System.out.println("apiURL=" + apiURL);
    		    String res = requestToServer(apiURL);
    		    return res;
    		  }
    	  /**
    	   * 서버 통신 메소드
    	   * @param apiURL
    	   * @return
    	   */
    private String requestToServer(String apiURL) {
	    return requestToServer(apiURL, "");
	  }
	  /**
	   * 서버 통신 메소드
	   * @param apiURL
	   * @param headerStr
	   * @return
	   */
	private String requestToServer(String apiURL, String headerStr) {
	    URL url;
	    int responseCode = 0;
	    StringBuffer res = null;
		try {
			url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
	    System.out.println("header Str: " + headerStr);
	    if(headerStr != null && !headerStr.equals("") ) {
	      con.setRequestProperty("Authorization", headerStr);
	    }
	    responseCode = con.getResponseCode();
	    BufferedReader br;
	    System.out.println("responseCode="+responseCode);
	    if(responseCode == 200) { // 정상 호출
	      br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	    } else {  // 에러 발생
	      br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    }
	    String inputLine;
	    res = new StringBuffer();
	    while ((inputLine = br.readLine()) != null) {
	      res.append(inputLine);
	    }
	    br.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if(responseCode==200) {
	    	return res.toString();
	    } else {
	    	return null;
	    }
	  }

}
