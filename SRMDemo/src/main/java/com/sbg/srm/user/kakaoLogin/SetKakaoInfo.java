package com.sbg.srm.user.kakaoLogin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SetKakaoInfo {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SetKakaoInfo.class);

	@RequestMapping(value="/setKakaoInfo")
	public String setKakaoInfo(@RequestParam Map<String,Object> paramMap, HttpSession session, Model model) {

		logger.info("�α��� ���� ���� kakao ������ ȸ������...");
		
		model.addAttribute("email",paramMap.get("email"));
		model.addAttribute("age",paramMap.get("age"));
		model.addAttribute("phone",paramMap.get("phone"));
		model.addAttribute("kakao_id",paramMap.get("id"));
		model.addAttribute("naver_id","");
		model.addAttribute("name",paramMap.get("name"));
		model.addAttribute("flag",paramMap.get("flag"));
		
		// �̺κ��� �״�� �Ѿ�� �ش�κ��� ������ �Է����� �ʾƵ� ���̵��ϰ� ����� �Է����ָ� �α��� �����ϰ� ����

		return "register";
	}
}
