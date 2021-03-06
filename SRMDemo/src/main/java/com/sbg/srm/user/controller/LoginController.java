package com.sbg.srm.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbg.srm.user.domain.LoginDTO;
import com.sbg.srm.user.domain.MemberDTO;
import com.sbg.srm.user.service.MemberService;

@Controller
public class LoginController {

	 private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LoginController.class);

	    
	    @Inject
	    private MemberService service;
	    
	    /**
	     * login page
	     * @param model
	     * @return
	     * @throws Exception
	     */
	    @RequestMapping(value = "/login", method = RequestMethod.GET)
	    public String login() throws Exception{
	 
	        logger.info("login page...");
	        

	        return "login";
	    }
	    
	    /**
	     * login processing
	     * @param model
	     * @return 
	     * @return
	     * @throws Exception
	     */
	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public @ResponseBody Map<String, Object> loginPOST(@RequestBody LoginDTO loginDTO, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception{
	 
	        logger.info("login processing...");
	        HttpSession session = request.getSession();

	        
	        if(session.getAttribute("login") != null) {
	        	logger.info("이전 세션 삭제");
	        	session.removeAttribute("login");
	        }
	        
	        
	        MemberDTO memberDTO = service.login(loginDTO);
	        Map<String, Object> map = new HashMap<String, Object>();

	        if(memberDTO == null || !(service.isValidUser(loginDTO.getId(), loginDTO.getPw()))){
		        logger.info("login failed...");

		        map.put("id", loginDTO.getId());
		        map.put("pw", loginDTO.getPw());
		        map.put("msg", "FAIL");

		        return map;
	        }
	        
	        else {
		        logger.info("login 성공 세션 저장...");

	        	session.setAttribute("memberId", memberDTO.getId());
	        	session.setAttribute("memberName", memberDTO.getName());
	        	session.setAttribute("MEMBERINFO", memberDTO);

		        map.put("id", memberDTO.getId());
		        map.put("pw", memberDTO.getPw());
		        map.put("name", memberDTO.getName());

		        map.put("msg", "SUCCESS");

		        
		        return map;
	        }
	    }
	    
	    // 로그아웃 처리
	    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(HttpServletRequest request,
	                         HttpServletResponse response,
	                         HttpSession httpSession) throws Exception {
	    	
	        logger.info("logout processing...");

	        Object object = httpSession.getAttribute("MEMBERINFO");
	        if (object != null) {
	            httpSession.removeAttribute("MEMBERINFO");
	            httpSession.removeAttribute("memberId");
	            httpSession.removeAttribute("memberName");

	            httpSession.invalidate();

	            }

	        return "logout";
	    }
	    

	    
	    // 로그인 성공
	    @RequestMapping(value = "/loginOk", method = RequestMethod.GET)
	    public String loginOk() throws Exception{
	 
	        logger.info("loginOk...");
	        return "loginOk";
	    }
	    
	    
	    /**
	     * login form 형식 구현 프로토타입
	     * @param model
	     * @return
	     * @throws Exception
	     */
	    @RequestMapping(value = "/login2", method = RequestMethod.GET)
	    public String login2(LoginDTO loginDTO, Model model) throws Exception{
	 
	        logger.info("login2...");
	        model.addAttribute("user", loginDTO);
	        return "login2";
	    }
	    
	    /**
	     * login processing 프로토타입
	     * @param model
	     * @return 
	     * @throws Exception
	     */
	    @RequestMapping(value = "/loginPost2", method = RequestMethod.POST)
	    public String loginPOST2(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception{
	 
	        logger.info("login2 processing...");

	        MemberDTO memberDTO = service.login(loginDTO);
	        
	        if(memberDTO == null || !(memberDTO.getPw().equals(loginDTO.getPw())) || !(memberDTO.getId().equals(loginDTO.getId()))){
		        model.addAttribute("user", loginDTO);
		        model.addAttribute("msg", "FAIL");
		        return "login2";
	        }
	        
	        else {
		        model.addAttribute("msg", "SUCCESS");
		        model.addAttribute("login", memberDTO);
		        return "index";
	        }
	    }
	    
	    
	    

}
