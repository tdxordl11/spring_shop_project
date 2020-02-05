package com.spring.shop_project;

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
	
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST �슂泥��쓣 �쐞�빐 湲곕낯媛믪씠 false�씤 setDoOutput�쓣 true濡�
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST �슂泥��뿉 �븘�슂濡� �슂援ы븯�뒗 �뙆�씪誘명꽣 �뒪�듃由쇱쓣 �넻�빐 �쟾�넚
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=eb4186f5fb71a201dcbc9a8d9ae2a4ff");
            sb.append("&redirect_uri=http://localhost:8084/shop_project/kakao_login");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    寃곌낵 肄붾뱶媛� 200�씠�씪硫� �꽦怨�
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    �슂泥��쓣 �넻�빐 �뼸�� JSON���엯�쓽 Response 硫붿꽭吏� �씫�뼱�삤湲�
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson �씪�씠釉뚮윭由ъ뿉 �룷�븿�맂 �겢�옒�뒪濡� JSON�뙆�떛 媛앹껜 �깮�꽦
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
	
//	naver@naver.co
//	nid_naver@naver.com
	
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    �슂泥��븯�뒗 �겢�씪�씠�뼵�듃留덈떎 媛�吏� �젙蹂닿� �떎瑜� �닔 �엳湲곗뿉 HashMap���엯�쑝濡� �꽑�뼵
	    HashMap<String, Object> userInfo = new HashMap<String, Object>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    �슂泥��뿉 �븘�슂�븳 Header�뿉 �룷�븿�맆 �궡�슜
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
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = "";
	        try {
				
	        	email = kakao_account.getAsJsonObject().get("email").getAsString();
			} catch (Exception e) {
				System.out.println("email�씠 �뾾�뒿�땲�떎.");
			}

	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
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
}
