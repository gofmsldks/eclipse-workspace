package com.exercise.ex.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {
	 private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LoginCheck.class);

	 
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView ) throws Exception {
	        HttpSession session = request.getSession();
	        ModelMap modelMap = modelAndView.getModelMap();
	        Object msg = modelMap.get("msg"); 

	        if (msg.equals("SUCCESS")) {
	    
	        	logger.info("사용자 정보 세션에 저장...");
		        Object memberDTO = modelMap.get("login"); 
	        	session.setAttribute("login", memberDTO);
	        	
	        }

		 
	 }
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        // 원래 있던 로그인 정보 제거
        if(session.getAttribute("login") != null) {
        	logger.info("이전 세션 삭제");
        	session.removeAttribute("login");
        }
        
        return true;
    }
}
