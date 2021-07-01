package com.exercise.ex.user.service;

import java.util.List;

import com.exercise.ex.user.domain.LoginDTO;
import com.exercise.ex.user.domain.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> selectMember() throws Exception;

	MemberDTO login(LoginDTO loginDTO) throws Exception;
	void register(MemberDTO memberDTO) throws Exception;
	boolean isValidUser(String id, String pw) throws Exception;
	
}
