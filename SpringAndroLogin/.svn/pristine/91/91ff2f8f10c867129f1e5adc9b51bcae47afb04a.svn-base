package com.exercise.ex.user.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.exercise.ex.user.domain.NaverLoginDTO;
import com.exercise.ex.user.naverLogin.NaverLoginBO;
import com.exercise.ex.user.service.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class NaverLoginController {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(NaverLoginController.class);

	@Inject
	private MemberService service;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String naver_login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		

		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		/**
		 * 네이버로 부터 전달 받은 회원 정보 Json 데이터 파싱
		 */
		
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		NaverLoginDTO naverLoginDTO = new NaverLoginDTO();
		naverLoginDTO.setEmail((String)apiJson.get("email"));
		naverLoginDTO.setName((String)apiJson.get("name"));
		naverLoginDTO.setNaver_id((String)apiJson.get("id"));
		naverLoginDTO.setApiJson(apiJson);
		
		Map<String, Object> naverConnectionCheck = service.naverConnectionCheck(naverLoginDTO);
        logger.info("결과 값..." + apiJson);
        
        if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
            logger.info("일치하는 이메일 없음 가입화면으로 넘어감...");

			model.addAttribute("email",apiJson.get("email"));
			model.addAttribute("naver_id",apiJson.get("id"));
			model.addAttribute("phone",apiJson.get("mobile"));
			model.addAttribute("name",apiJson.get("name"));
			model.addAttribute("age",apiJson.get("birthyear"));
			model.addAttribute("kakao_id","");
			model.addAttribute("flag","naver");

			// 이부분이 그대로 넘어가서 해당부분을 별도로 입력하지 않아도 아이디하고 비번만 입력해주면 로그인 가능하게 구현
			
			return "register";
			
		}else if(naverConnectionCheck.get("naver_login") == null && naverConnectionCheck.get("email") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
            logger.info("네이버 로그인 연동 되어있지 않음...연동후 로그인 진행");
			service.setNaverConnection(naverLoginDTO);
            logger.info("네이버 아이디와 연동 완료...");

            logger.info("세션 저장...");

			session.setAttribute("memberId",(String)apiJson.get("email") );
			session.setAttribute("memberName",(String)apiJson.get("name") );
			session.setAttribute("MEMBERINFO",naverLoginDTO);


		}else { //모두 연동 되어있을시
			
            logger.info("네이버 아이디와 연동 되어져있는 회원...");

            logger.info("세션 저장...");
			session.setAttribute("memberId",(String)apiJson.get("email") );
			session.setAttribute("memberName",(String)apiJson.get("name") );
			session.setAttribute("MEMBERINFO",naverLoginDTO);

		}

/*
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		//response의 nickname값 파싱
		String nname = (String) apiJson.get("name");
		String nemail = (String) apiJson.get("email");
		String ngender = (String) apiJson.get("gender");
		String nbirthday = (String) apiJson.get("birthday");
		String nage = (String) apiJson.get("age");
		String nimage = (String) apiJson.get("profile_image");

		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("nname", nname);
		session.setAttribute("nemail", nemail);
		session.setAttribute("ngender", ngender);
		session.setAttribute("nbirthday", nbirthday);
		session.setAttribute("nage", nage);
		session.setAttribute("nimage", nimage);
*/
        
		return "redirect:/index";
	}

}


