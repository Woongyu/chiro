package com.ch.service;

import java.util.List;
import java.util.Map;

import com.ch.vo.CommandMap;

public interface MyService {
	
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	
	void insUser(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMemberList(CommandMap map) throws Exception;
	
	Map<String, Object> selectMemberDetail(String sStr) throws Exception;

	Object delUser(String sStr) throws Exception;
	
}
