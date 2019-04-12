package com.ch.service;

import java.util.List;
import java.util.Map;

import com.ch.vo.CommandMap;

public interface MyService {
	
	Object insUser(Map<String, Object> map) throws Exception;
	
	Object updUser(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> srchUserList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> srchUserDetail(String sStr) throws Exception;

	Object delUser(String sStr) throws Exception;

	List<Map<String, Object>> srchBoardList(Map<String, Object> map) throws Exception;

	Object insNotice(Map<String, Object> map) throws Exception;

	void updBoardHit(String sStr) throws Exception;

	Map<String, Object> srchBoardDetail(String sStr) throws Exception;

	Object delBoard(String sStr) throws Exception;

	Object updNotice(Map<String, Object> map) throws Exception;

}
