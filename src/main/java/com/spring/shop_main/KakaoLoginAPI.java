package com.spring.shop_main;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoLoginAPI {
	
	String tid = null;
	
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=eb4186f5fb71a201dcbc9a8d9ae2a4ff");
            sb.append("&redirect_uri=http://localhost:8081/shop_project/kakao_login");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
//            Map<String, Object> userinfo = new JSONParser(result).parseObject();
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
	

	
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<String, Object>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
//	        Map<String, Object> element = new JSONParser(result).parseObject();
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String kakaoId = element.getAsJsonObject().get("id").getAsString();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = "";
	        
	        try {
				
	        	email = kakao_account.getAsJsonObject().get("email").getAsString();
			} catch (Exception e) {
				System.out.println("email없음.");
			}
	        

	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        userInfo.put("kakaoId", kakaoId);
	        br.close();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	        br.close();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	}
	
	 public void kakaoUnlink(String access_Token) {
		    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
//		    String admin_key = "e077b7dea751e18b8fdafb6ff3ad12b5";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String result = "";
		        String line = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println(result);
		        br.close();
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }

	 }
	 
	 public String getReadyPay (String name, int num, int price) {
//		    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
			    String result = "";
			    String next_redirect_url = "";
			    String reqURL = "https://kapi.kakao.com/v1/payment/ready";
			    int vat = price/11;
			    try {
			        URL url = new URL(reqURL);
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("POST");
			        conn.setDoOutput(true);
			        
			        //    요청에 필요한 Header에 포함될 내용
			        conn.setRequestProperty("Authorization", "KakaoAK " +  "e077b7dea751e18b8fdafb6ff3ad12b5");
			        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			        
			        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		            StringBuilder sb = new StringBuilder();
		            
		            sb.append("&cid=TC0ONETIME");
		            sb.append("&partner_order_id=partner_order_id");
		            sb.append("&partner_user_id=partner_user_id");
		            sb.append("&item_name=" + name);
		            sb.append("&quantity=" + num);
		            sb.append("&total_amount=" + price);
		            sb.append("&vat_amount=" + vat);
		            sb.append("&tax_free_amount=0");
		            sb.append("&approval_url=http://localhost:8081/shop_project/kakao_pay_success");
		            sb.append("&fail_url=https://localhost:8081/shop_project/fail");
		            sb.append("&cancel_url=http://localhost:8081/shop_project/kakao_pay_cancel");
		            bw.write(sb.toString());
		            bw.flush();
			        
			        int responseCode = conn.getResponseCode();
			        System.out.println("responseCode : " + responseCode);
			        
			        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        
			        String line = "";
//			        String result = "";
			        
			        while ((line = br.readLine()) != null) {
			            result += line;
			        }
			        System.out.println("response body : " + result);
			        
			        JsonParser parser = new JsonParser();
			        JsonElement element = parser.parse(result);
			        
			        next_redirect_url = element.getAsJsonObject().get("next_redirect_pc_url").getAsString();
			        tid = element.getAsJsonObject().get("tid").getAsString();
			        br.close();
			    } catch (IOException e) {
			        // TODO Auto-generated catch block
			        e.printStackTrace();
			    }
			    
			    return next_redirect_url;
		    }
	 
	 public String getReadyPaySucess (String pg_token) {
		    String result = "";
//		    String pg_token = "";
		    String reqURL = "https://kapi.kakao.com/v1/payment/approve";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setDoOutput(true);
		        
		        //    요청에 필요한 Header에 포함될 내용
		        conn.setRequestProperty("Authorization", "KakaoAK " +  "e077b7dea751e18b8fdafb6ff3ad12b5");
		        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		        
		        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
	            StringBuilder sb = new StringBuilder();
	            
	            sb.append("&cid=TC0ONETIME");
	            sb.append("&tid=" + tid);
	            sb.append("&partner_order_id=partner_order_id");
	            sb.append("&partner_user_id=partner_user_id");
	            sb.append("&pg_token=" + pg_token);
	            bw.write(sb.toString());
	            bw.flush();
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		        
		        String line = "";
//		        String result = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("pay success response body : " + result);
		        
//		        JsonParser parser = new JsonParser();
//		        JsonElement element = parser.parse(result);
//		        
//		        next_redirect_url = element.getAsJsonObject().get("next_redirect_pc_url").getAsString();
		        br.close();
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		    
		    return result;
	    }
}
