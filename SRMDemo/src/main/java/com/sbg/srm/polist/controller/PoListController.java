package com.sbg.srm.polist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sbg.srm.polist.domain.PoListInfoDTO;
import com.sbg.srm.polist.domain.PoListSearchDTO;
import com.sbg.srm.polist.service.PoListService;


@Controller
public class PoListController {
	
	@Inject
	private PoListService poListservice;
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(PoListController.class);

	@RequestMapping("/detail")
	public String detailList(HttpSession httpSession, HttpServletRequest request, Model model) throws Exception{
		
		HttpSession session = request.getSession();
		String memberName = (String)session.getAttribute("memberName");
		ArrayList<PoListInfoDTO> initPoList = poListservice.selectAllPoList(memberName);
		
		ObjectMapper mapper = new ObjectMapper();
		String initPoListJson = mapper.writeValueAsString( initPoList );
		model.addAttribute("data", initPoListJson);
		logger.info("발주 리스트...");
		
		return "detail";
	}
	
	
	/**
	 * PO list!!!!!!!!!!!!!!!
	 * @param poDTO
	 * datatables에 값 반환할때 data로 무조건 해주어야함. 안그러면 오류. 
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/listSearch", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> listSearch(@RequestBody PoListSearchDTO poListSearchDTO, HttpSession httpSession, HttpServletRequest request, Model model) throws Exception{

		logger.info("Print...UserList");
		HttpSession session = request.getSession();

		Map<String, Object> data = new HashMap<String, Object>();
		logger.info(poListSearchDTO.getSearch(), poListSearchDTO.getStartDate(), poListSearchDTO.getEndDate());
		if(poListSearchDTO.getSearch() != null && poListSearchDTO.getStartDate() != null && poListSearchDTO.getEndDate() != null) {
			logger.info("...접근가능");

			ArrayList<PoListInfoDTO> poSearchList = poListservice.selectSearchPoList(poListSearchDTO);
			
			data.put("msg", "EXIST");
			data.put("poList", poSearchList);
			return data;
		}
		else {
			logger.info("...검색어미입력");

			data.put("msg", "NONE");
			return data;
		}


	}
}
