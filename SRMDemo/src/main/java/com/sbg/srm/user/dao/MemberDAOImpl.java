package com.sbg.srm.user.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sbg.srm.user.domain.KakaoLoginDTO;
import com.sbg.srm.user.domain.LoginDTO;
import com.sbg.srm.user.domain.MemberDTO;
import com.sbg.srm.user.domain.NaverLoginDTO;


@Repository

public class MemberDAOImpl implements MemberDAO{
	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.sebang.srm.mappers.memberMapper";
    
    @Override
    public List<MemberDTO> selectMember() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectMember");
    }

    // 로그인 처리
    
	@Override
	public MemberDTO login(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".login", loginDTO);
	}
	
	// 회원가입 처리

	@Override
	public void register(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace + ".register", memberDTO);

	}

	// 비밀번호 검색
	
	@Override
	public String getUserPW(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".getUserPw", id);
	}
	
	// 아이디 검색

	@Override
	public String getUserID(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".getUserId", id);
	}

	@Override
	public Map<String, Object> getNaverConn(NaverLoginDTO naverLoginDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".getNaverConn", naverLoginDTO);
	}

	@Override
	public void setNaverConnection(NaverLoginDTO naverLoginDTO) throws Exception {
		// TODO Auto-generated method stub
		 sqlSession.update(Namespace + ".setNaverConnection", naverLoginDTO);

	}

	@Override
	public Map<String, Object> getKakaoConn(KakaoLoginDTO kakaoLoginDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".getKakaoConn", kakaoLoginDTO);
	}

	@Override
	public void setKakaoConnection(KakaoLoginDTO kakaoLoginDTO) throws Exception {
		 sqlSession.update(Namespace + ".setKakaoConnection", kakaoLoginDTO);
		
	}






}
