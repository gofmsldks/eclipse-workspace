package com.sbg.srm.polist.service;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sbg.srm.polist.dao.PoListDAO;
import com.sbg.srm.polist.domain.PoListInfoDTO;
import com.sbg.srm.polist.domain.PoListSearchDTO;

@Service
public class PoListServiceImpl implements PoListService {

	@Inject
	PoListDAO poListDao;

	@Override
	public ArrayList<PoListInfoDTO> selectAllPoList(String userName) throws Exception {
		return (ArrayList<PoListInfoDTO>) poListDao.selectAllPoList(userName);

	}

	@Override
	public ArrayList<PoListInfoDTO> selectSearchPoList(PoListSearchDTO poListSearchDTO) throws Exception {
		return (ArrayList<PoListInfoDTO>) poListDao.selectSearchPoList(poListSearchDTO);
	}

	@Override
	public void createPoList(PoListInfoDTO poListInfoDTO) throws Exception {
		poListDao.createPoList(poListInfoDTO);
	}

	@Override
	public void updatePoList(PoListInfoDTO poListInfoDTO) throws Exception {
		poListDao.updatePoList(poListInfoDTO);
		
	}

	@Override
	public void deletePoList(PoListInfoDTO poListInfoDTO) throws Exception {
		poListDao.deletePoList(poListInfoDTO);
		
	}


	


}
