package com.spring.shop_project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
public class AuthInterceptor extends HandlerInterceptorAdapter{
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {    
    	HttpSession session = request.getSession();
    	
        SessionVO sessionVO = (SessionVO)session.getAttribute("session");
        
		if (sessionVO == null){
            logger.info(">> interceptor catch!!! session is null.. ");            
            session.invalidate();            
            response.sendRedirect(request.getContextPath() + "/admin/login");
            
            return false;            
        }
        
        return true;        
    }    
}
