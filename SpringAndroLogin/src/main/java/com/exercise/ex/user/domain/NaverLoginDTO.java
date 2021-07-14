package com.exercise.ex.user.domain;

import java.util.Map;

public class NaverLoginDTO {
	private String name;
	private String email;
	private String id;
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
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
