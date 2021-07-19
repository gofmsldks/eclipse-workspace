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
	//�α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping(value = "/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String naver_login(Model model, HttpSession session) {
		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("���̹�:" + naverAuthUrl);
		//���̹�
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}
	
	//���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		System.out.println("����� callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. �α��� ����� ������ �о�´�.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String������ json������
		
		

		/** apiResult json ����
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		
		/**
		 * ���̹��� ���� ���� ���� ȸ�� ���� Json ������ �Ľ�
		 */
		
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		NaverLoginDTO naverLoginDTO = new NaverLoginDTO();
		naverLoginDTO.setEmail((String)apiJson.get("email"));
		naverLoginDTO.setName((String)apiJson.get("name"));
		naverLoginDTO.setNaver_id((String)apiJson.get("id"));
		naverLoginDTO.setApiJson(apiJson);
		
		Map<String, Object> naverConnectionCheck = service.naverConnectionCheck(naverLoginDTO);
        logger.info("��� ��..." + apiJson);
        
        if(naverConnectionCheck == null) { //��ġ�ϴ� �̸��� ������ ����
            logger.info("��ġ�ϴ� �̸��� ���� ����ȭ������ �Ѿ...");

			model.addAttribute("email",apiJson.get("email"));
			model.addAttribute("naver_id",apiJson.get("id"));
			model.addAttribute("phone",apiJson.get("mobile"));
			model.addAttribute("name",apiJson.get("name"));
			model.addAttribute("age",apiJson.get("birthyear"));
			model.addAttribute("kakao_id","");
			model.addAttribute("flag","naver");

			// �̺κ��� �״�� �Ѿ�� �ش�κ��� ������ �Է����� �ʾƵ� ���̵��ϰ� ����� �Է����ָ� �α��� �����ϰ� ����
			
			return "register";
			
		}else if(naverConnectionCheck.get("naver_login") == null && naverConnectionCheck.get("email") != null) { //�̸��� ���� �Ǿ��ְ� ���̹� ���� �ȵǾ� ������
            logger.info("���̹� �α��� ���� �Ǿ����� ����...������ �α��� ����");
			service.setNaverConnection(naverLoginDTO);
            logger.info("���̹� ���̵�� ���� �Ϸ�...");

            logger.info("���� ����...");

			session.setAttribute("memberId",(String)apiJson.get("email") );
			session.setAttribute("memberName",(String)apiJson.get("name") );
			session.setAttribute("MEMBERINFO",naverLoginDTO);


		}else { //��� ���� �Ǿ�������
			
            logger.info("���̹� ���̵�� ���� �Ǿ����ִ� ȸ��...");

            logger.info("���� ����...");
			session.setAttribute("memberId",(String)apiJson.get("email") );
			session.setAttribute("memberName",(String)apiJson.get("name") );
			session.setAttribute("MEMBERINFO",naverLoginDTO);

		}

/*
		//3. ������ �Ľ�
		//Top���� �ܰ� _response �Ľ�
		//response�� nickname�� �Ľ�
		String nname = (String) apiJson.get("name");
		String nemail = (String) apiJson.get("email");
		String ngender = (String) apiJson.get("gender");
		String nbirthday = (String) apiJson.get("birthday");
		String nage = (String) apiJson.get("age");
		String nimage = (String) apiJson.get("profile_image");

		//4.�Ľ� �г��� �������� ����
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


