package com.exercise.ex.user.dao;

import java.util.List;

import com.exercise.ex.user.domain.LoginDTO;
import com.exercise.ex.user.domain.MemberDTO;

public interface MemberDAO {
	
	// 회원 목록 보이기(테스트용)
    public List<MemberDTO> selectMember() throws Exception;
    
    // 로그인 처리
    public MemberDTO login(LoginDTO loginDTO) throws Exception;
    
    // 회원 가입 처리
    public void register(MemberDTO memberDTO) throws Exception; 
    
    // 비밀번호 찾기 처리
    public String getUserPW(String id) throws Exception;
    
    // 아이디 찾기 처리
    public String getUserID(String name) throws Exception;
}




