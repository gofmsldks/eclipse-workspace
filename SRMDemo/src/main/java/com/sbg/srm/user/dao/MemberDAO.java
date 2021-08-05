package com.sbg.srm.user.dao;

import java.util.List;
import java.util.Map;

import com.sbg.srm.user.domain.KakaoLoginDTO;
import com.sbg.srm.user.domain.LoginDTO;
import com.sbg.srm.user.domain.MemberDTO;
import com.sbg.srm.user.domain.NaverLoginDTO;

public interface MemberDAO {
	
	// ȸ�� ��� ���̱�(�׽�Ʈ��)
    public List<MemberDTO> selectMember() throws Exception;
    
    // �α��� ó��
    public MemberDTO login(LoginDTO loginDTO) throws Exception;
    
    // ȸ�� ���� ó��
    public void register(MemberDTO memberDTO) throws Exception; 
    
    // ��й�ȣ ã�� ó��
    public String getUserPW(String id) throws Exception;
    
    // ���̵� ã�� ó��
    public String getUserID(String name) throws Exception;
    
    // ���̹� ���̵� ���� ����
    public Map<String, Object> getNaverConn(NaverLoginDTO naverLoginDTO) throws Exception;

	public void setNaverConnection(NaverLoginDTO naverLoginDTO) throws Exception;

	public Map<String, Object> getKakaoConn(KakaoLoginDTO kakaoLoginDTO) throws Exception;

	public void setKakaoConnection(KakaoLoginDTO kakaoLoginDTO) throws Exception;


}




