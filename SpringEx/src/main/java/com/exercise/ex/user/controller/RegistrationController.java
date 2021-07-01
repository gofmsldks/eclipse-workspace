package com.exercise.ex.user.controller;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exercise.ex.user.domain.MemberDTO;
import com.exercise.ex.user.service.MemberService;

@Controller

public class RegistrationController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(RegistrationController.class);

	
	@Inject
	private MemberService service;

	
	
    // 회원가입 페이지
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() throws Exception {
    	
        logger.info("register page...");

        return "register";
    }
    
    // 회원가입 페이지
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPost(MemberDTO memberDTO, RedirectAttributes redirectAttributes) throws Exception {
    	
    	
    	logger.info("register process...");
        String hashedPw = BCrypt.hashpw(memberDTO.getPw(), BCrypt.gensalt());
        memberDTO.setPw(hashedPw);
        service.register(memberDTO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");
        return "redirect:/login";
    }
	
}
