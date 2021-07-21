package com.exercise.ex.user.kakaoLogin;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.exercise.ex.user.domain.KakaoLoginDTO;
import com.exercise.ex.user.service.MemberService;

@RestController
public class KakaoLoginController {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(KakaoLoginController.class);

	@Inject
	private  MemberService service;
	
	@RequestMapping(value="/kakaoCallback", method=RequestMethod.POST)
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String, Object> paramMap, HttpSession session) throws SQLException, Exception {

		logger.info("paramMap:" + paramMap);

		KakaoLoginDTO kakaoLoginDTO = new KakaoLoginDTO(); 
		Map<String, Object> resultMap = new HashMap<String, Object>();

		kakaoLoginDTO.setEmail((String)paramMap.get("email"));
		kakaoLoginDTO.setName((String)paramMap.get("nickName"));
		kakaoLoginDTO.setKakao_id((String)paramMap.get("id"));
		Map<String, Object> kakaoConnectionCheck = service.kakaoConnectionCheck(kakaoLoginDTO);

		if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
			((HashMap<String, Object>) resultMap).put("JavaData", "register");
			
		}else if(kakaoConnectionCheck.get("kakao_login") == null && kakaoConnectionCheck.get("email") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
			System.out.println("kakaoLogin");
			service.setKakaoConnection(kakaoLoginDTO);
			
			session.setAttribute("memberId",(String)paramMap.get("email") );
			session.setAttribute("memberName",(String)paramMap.get("nickName") );
			session.setAttribute("MEMBERINFO",kakaoLoginDTO);;
			resultMap.put("JavaData", "YES");
			
		}else{ //모두 연동 되어있을시
			session.setAttribute("memberId",(String)paramMap.get("email") );
			session.setAttribute("memberName",(String)paramMap.get("nickName") );
			session.setAttribute("MEMBERINFO",kakaoLoginDTO);;
			resultMap.put("JavaData", "YES");
		}
		
		return resultMap;
	}
	
}
