package com.exercise.ex.user.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exercise.ex.user.domain.MemberDTO;
import com.exercise.ex.user.service.MemberService;

@Controller
public class HomeController {
	
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);


    
    @Inject
    private MemberService service;
    
    /**
     * init login page
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Locale locale, Model model) throws Exception{
 
        logger.info("index");

        return "login";
    }
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) throws Exception{
 
        logger.info("init page");
        List<MemberDTO> memberList = service.selectMember();
        
        model.addAttribute("memberList", memberList);
 
        return "index";
    }
    
}

