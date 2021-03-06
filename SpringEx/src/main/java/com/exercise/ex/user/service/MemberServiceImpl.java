package com.exercise.ex.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.exercise.ex.user.dao.MemberDAO;
import com.exercise.ex.user.domain.LoginDTO;
import com.exercise.ex.user.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
 
    @Inject
    private MemberDAO dao;
    
    @Override
    public List<MemberDTO> selectMember() throws Exception {
 
        return dao.selectMember();
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
 
}


