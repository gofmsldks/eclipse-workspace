package com.sbg.srm.polist.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sbg.srm.polist.domain.PoListInfoDTO;
import com.sbg.srm.polist.domain.PoListSearchDTO;

@Repository
public class PoListDAOImpl implements PoListDAO {
	
    @Inject
    private SqlSession sqlSession;
    private static final String Namespace = "com.sebang.srm.mappers.poListMapper";
    
	@Override
	public List<PoListInfoDTO> selectAllPoList(String userName) throws Exception{
		
		return sqlSession.selectList(Namespace + ".selectAllPoList", userName);
	}

	@Override
	public List<PoListInfoDTO> selectSearchPoList(PoListSearchDTO poListSearchDTO) throws Exception{
		return sqlSession.selectList(Namespace + ".selectSearchPoList", poListSearchDTO);
	}

}
