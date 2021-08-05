package com.sbg.srm.user.domain;

import java.util.Map;

public class NaverLoginDTO {
	private String name;
	private String email;
	private String naver_id;
	private Map<String, Object> apiJson;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getApiJson() {
		return name;
	}

	public void setApiJson(Map<String, Object> apiJson) {
		this.apiJson = apiJson;
	}
	
	public String getNaver_id() {
		return naver_id;
	}

	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}

}
