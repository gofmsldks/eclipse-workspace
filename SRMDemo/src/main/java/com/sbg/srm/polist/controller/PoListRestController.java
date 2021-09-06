package com.sbg.srm.polist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sbg.srm.polist.domain.PoListInfoDTO;
import com.sbg.srm.polist.service.PoListService;

@RestController
public class PoListRestController {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(PoListRestController.class);

	@Inject
	PoListService poListService;
	
	// CREATE
	@RequestMapping(value = "/poCreate", method = RequestMethod.POST)
	public Map<String, Object> createPoList(@RequestBody PoListInfoDTO poListInfoDTO, HttpSession httpSession, HttpServletRequest request, Model model){
		
			logger.info("Create Po...");
			Map<String, Object> data = new HashMap<String, Object>();
	
			try {
				poListService.createPoList(poListInfoDTO);
				
			}catch(DataAccessException e){
				data.put("msg", "INSERTERROR");
	
			}catch(Exception e) {
				e.printStackTrace();
	
			}	
		
		
		
		
			logger.info("Create 후  POlist 반환...");

			ArrayList<PoListInfoDTO> poSearchList;
			try {
				poSearchList = poListService.selectAllPoList(poListInfoDTO.getUser_name());
				data.put("msg", "EXIST");
				data.put("poList", poSearchList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return data;
			
			

	}
	
	//READ
	@RequestMapping(value = "/poRead", method = RequestMethod.POST)
	public Map<String, Object> readPoList(@RequestBody PoListInfoDTO poListInfoDTO, HttpSession httpSession, HttpServletRequest request, Model model){
		
		return null;
	}
	
	//UPDATE
	@RequestMapping(value = "/poUpdate", method = RequestMethod.PATCH)
	public Map<String, Object> updatePoList(@RequestBody PoListInfoDTO poListInfoDTO, HttpSession httpSession, HttpServletRequest request, Model model){
		
		logger.info("Update Po...");
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			poListService.updatePoList(poListInfoDTO);
			
		}catch(DataAccessException e){
			data.put("msg", "EDITERROR");

		}catch(Exception e) {
			e.printStackTrace();

		}	
	
	
		logger.info("EDIT 후  POlist 반환...");

		ArrayList<PoListInfoDTO> poSearchList;
		try {
			poSearchList = poListService.selectAllPoList(poListInfoDTO.getUser_name());
			data.put("msg", "EXIST");
			data.put("poList", poSearchList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}
	
	
	//DELETE
	@RequestMapping(value = "/poDelete", method = RequestMethod.DELETE)
	public Map<String, Object> deletePoList(@RequestBody PoListInfoDTO poListInfoDTO, HttpSession httpSession, HttpServletRequest request, Model model){
		
		logger.info("DELETE Po...");
		Map<String, Object> data = new HashMap<String, Object>();

		try {
			poListService.deletePoList(poListInfoDTO);
			
		}catch(DataAccessException e){
			data.put("msg", "DELETEERROR");

		}catch(Exception e) {
			e.printStackTrace();

		}	
	
	
		logger.info("DELETE 후  POlist 반환...");

		ArrayList<PoListInfoDTO> poSearchList;
		try {
			poSearchList = poListService.selectAllPoList(poListInfoDTO.getUser_name());
			data.put("msg", "DELETESUCCESS");
			data.put("poList", poSearchList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}
}
