package com.sbg.srm.polist.dao;

import java.util.List;

import com.sbg.srm.polist.domain.PoListInfoDTO;
import com.sbg.srm.polist.domain.PoListSearchDTO;

public interface PoListDAO {

	public List<PoListInfoDTO> selectAllPoList(String userName) throws Exception;
	public List<PoListInfoDTO> selectSearchPoList(PoListSearchDTO poListSearchDTO) throws Exception;
	public void createPoList(PoListInfoDTO poListInfoDTO) throws Exception;
	public void updatePoList(PoListInfoDTO poListInfoDTO) throws Exception;
	public void deletePoList(PoListInfoDTO poListInfoDTO) throws Exception;

}
