package com.ch.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ch.dao.MyDAO;
import com.ch.vo.CommandMap;

@Service("myService")
public class MyServiceImpl implements MyService {

	@Resource(name = "myDAO")
	private MyDAO myDAO;
	
	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		myDAO.updateHitCnt(map);
		Map<String, Object> resultMap = null;
		return resultMap;
	}

	@Override
	public void insUser(Map<String, Object> map) throws Exception {
		myDAO.insUser(map);
	}

	@Override
	public List<Map<String, Object>> selectMemberList(CommandMap map) throws Exception {
		return myDAO.selectMemberList(map);
	}

	@Override
	public Map<String, Object> selectMemberDetail(String sStr) throws Exception {
		return myDAO.selectMemberDetail(sStr);
	}

	@Override
	public Object delUser(String sStr) throws Exception {
		return myDAO.delUser(sStr);
	}

}
