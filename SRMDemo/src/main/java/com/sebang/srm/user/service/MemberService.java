package com.exercise.ex.user.service;

import java.util.ArrayList;
import java.util.Map;

import com.exercise.ex.user.domain.KakaoLoginDTO;
import com.exercise.ex.user.domain.LoginDTO;
import com.exercise.ex.user.domain.MemberDTO;
import com.exercise.ex.user.domain.NaverLoginDTO;

public interface MemberService {
	
	public ArrayList<MemberDTO> selectMember() throws Exception;
	MemberDTO login(LoginDTO loginDTO) throws Exception;
	void register(MemberDTO memberDTO) throws Exception;
	boolean isValidUser(String id, String pw) throws Exception;

	public Map<String, Object> naverConnectionCheck(NaverLoginDTO naverLoginDTO) throws Exception; // ���̹� ���� üũ
	public void setNaverConnection(NaverLoginDTO naverLoginDTO) throws Exception; // ���̹� ���̵�� ���� ���� ������ ���� 
	
	public Map<String, Object> kakaoConnectionCheck(KakaoLoginDTO kakaoLoginDTO) throws Exception; // īī�� ���� üũ
	public void setKakaoConnection(KakaoLoginDTO kakaoLoginDTO) throws Exception; //īī�� ���̵�� ���� ���� ������ ����

	
}
