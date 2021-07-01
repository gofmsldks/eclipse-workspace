package com.exercise.ex.user.dao;

import java.util.List;

import com.exercise.ex.user.domain.LoginDTO;
import com.exercise.ex.user.domain.MemberDTO;

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
}




