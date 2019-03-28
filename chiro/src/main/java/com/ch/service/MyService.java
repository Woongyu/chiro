package com.ch.service;

import java.util.List;
import java.util.Map;

public interface MyService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception;

	void insertBoard(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void insUser(Map<String, Object> map) throws Exception;
	
}
