package com.exercise.ex.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exercise.ex.user.domain.LoginDTO;
import com.exercise.ex.user.domain.MemberDTO;
import com.exercise.ex.user.naverLogin.NaverLoginBO;
import com.exercise.ex.user.service.MemberService;

@Controller
public class HomeController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Inject
	private MemberService service;
	
	
	/**
	 * init login page
	 */
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String index(HttpSession session, Model model) throws Exception{

		logger.info("index");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model) throws Exception{

		logger.info("main page...");
		List<MemberDTO> memberList = service.selectMember();

		model.addAttribute("memberList", memberList);

		return "index";
	}

	/**
	 * User list!!!!!!!!!!!!!!!
	 * @param loginDTO
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loginPOST(@RequestBody LoginDTO loginDTO, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception{

		logger.info("Print...UserList");
		HttpSession session = request.getSession();

		Map<String, Object> map = new HashMap<String, Object>();
		if(loginDTO != null) {
			logger.info("...접근가능");

			ArrayList<MemberDTO> memberList = service.selectMember();
			map.put("msg", "UserListReadSUCCESS");
			map.put("userList", memberList);
			return map;
		}
		else {
			logger.info("...잘못된접근");

			map.put("msg", "UserListReadFAIL");
			return map;
		}


	}

}
