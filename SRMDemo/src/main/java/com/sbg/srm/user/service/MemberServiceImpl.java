package com.sbg.srm.user.service;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.sbg.srm.user.dao.MemberDAO;
import com.sbg.srm.user.domain.KakaoLoginDTO;
import com.sbg.srm.user.domain.LoginDTO;
import com.sbg.srm.user.domain.MemberDTO;
import com.sbg.srm.user.domain.NaverLoginDTO;

@Service
public class MemberServiceImpl implements MemberService {
 
    @Inject
    private MemberDAO dao;
    
    @Override
    public ArrayList<MemberDTO> selectMember() throws Exception {
 
        return (ArrayList<MemberDTO>)dao.selectMember();
    }

	@Override
	public MemberDTO login(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		MemberDTO loingInfo = dao.login(loginDTO);
		return loingInfo;
	}

	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		dao.register(memberDTO);
	}

	@Override
	public boolean isValidUser(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		if(id.equals(dao.getUserID(id)) &&  BCrypt.checkpw(pw, dao.getUserPW(id))) {
			return true;
		}
		else{
			return false;
		}
	}
	
	@Override
	public Map<String, Object> naverConnectionCheck(NaverLoginDTO naverLoginDTO) throws Exception {
		Map<String, Object> naverConInfo = dao.getNaverConn(naverLoginDTO);
		return naverConInfo;
	}

	@Override
	public void setNaverConnection(NaverLoginDTO naverLoginDTO) throws Exception {

		dao.setNaverConnection(naverLoginDTO);
	}

	@Override
	public Map<String, Object> kakaoConnectionCheck(KakaoLoginDTO kakaoLoginDTO) throws Exception {
		Map<String, Object> kakaoConInfo = dao.getKakaoConn(kakaoLoginDTO);
		return kakaoConInfo;
	}

	@Override
	public void setKakaoConnection(KakaoLoginDTO kakaoLoginDTO) throws Exception {
		// TODO Auto-generated method stub
		
		dao.setKakaoConnection(kakaoLoginDTO);
		
	}
 
}


