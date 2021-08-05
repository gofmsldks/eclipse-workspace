package com.sbg.srm.user.dao;

import java.util.List;
import java.util.Map;

import com.sbg.srm.user.domain.KakaoLoginDTO;
import com.sbg.srm.user.domain.LoginDTO;
import com.sbg.srm.user.domain.MemberDTO;
import com.sbg.srm.user.domain.NaverLoginDTO;

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
    
    // 네이버 아이디 연동 유무
    public Map<String, Object> getNaverConn(NaverLoginDTO naverLoginDTO) throws Exception;

	public void setNaverConnection(NaverLoginDTO naverLoginDTO) throws Exception;

	public Map<String, Object> getKakaoConn(KakaoLoginDTO kakaoLoginDTO) throws Exception;

	public void setKakaoConnection(KakaoLoginDTO kakaoLoginDTO) throws Exception;


}




