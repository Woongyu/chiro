package com.ch.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ch.dao.MyDAO;

@Service("myService")
public class MyServiceImpl implements MyService {

	@Resource(name = "myDAO")
	private MyDAO myDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception {
		return myDAO.selectBoardList(commandMap);
	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		myDAO.insertBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		myDAO.updateHitCnt(map);
		Map<String, Object> resultMap = myDAO.selectBoardDetail(map);
		return resultMap;
	}

	@Override
	public void insUser(Map<String, Object> map) throws Exception {
		myDAO.insUser(map);
	}

}
