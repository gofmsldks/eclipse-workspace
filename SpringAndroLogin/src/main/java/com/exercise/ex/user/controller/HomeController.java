package com.exercise.ex.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exercise.ex.user.domain.LoginDTO;
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
