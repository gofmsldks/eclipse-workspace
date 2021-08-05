package com.sbg.srm.polist.service;

import java.util.ArrayList;

import com.sbg.srm.polist.domain.PoListInfoDTO;
import com.sbg.srm.polist.domain.PoListSearchDTO;

public interface PoListService {

	public ArrayList<PoListInfoDTO> selectAllPoList(String userName) throws Exception;
	public ArrayList<PoListInfoDTO> selectSearchPoList(PoListSearchDTO poListSearchDTO) throws Exception;
}
