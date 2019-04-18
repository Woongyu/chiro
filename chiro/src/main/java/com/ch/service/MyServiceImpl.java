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
	public Object insUser(Map<String, Object> map) throws Exception {
		return myDAO.insUser(map);
	}
	
	@Override
	public Object updUser(Map<String, Object> map) throws Exception {
		return myDAO.updUser(map);
	}
	
	@Override
	public List<Map<String, Object>> srchUserList(Map<String, Object> map) throws Exception {
		return myDAO.srchUserList(map);
	}
	
	@Override
	public List<Map<String, Object>> srchUserDetail(String sStr) throws Exception {
		return myDAO.srchUserDetail(sStr);
	}

	@Override
	public Object delUser(String sStr) throws Exception {
		return myDAO.delUser(sStr);
	}

	@Override
	public List<Map<String, Object>> srchBoardList(Map<String, Object> map) throws Exception {
		return myDAO.srchBoardList(map);
	}

	@Override
	public Object insBoard(Map<String, Object> map) throws Exception {
		return myDAO.insBoard(map);
	}
	
	@Override
	public Object updBoard(Map<String, Object> map) throws Exception {
		return myDAO.updBoard(map);
	}

	@Override
	public void updBoardHit(String sStr) throws Exception {
		myDAO.updBoardHit(sStr);
	}

	@Override
	public Map<String, Object> srchBoardDetail(String sStr) throws Exception {
		return myDAO.srchBoardDetail(sStr);
	}

	@Override
	public Object delBoard(String sStr) throws Exception {
		return myDAO.delBoard(sStr);
	}

	@Override
	public Object insComment(Map<String, Object> map) throws Exception {
		return myDAO.insComment(map);
	}

	@Override
	public List<Map<String, Object>> srchCommentList(String sStr) throws Exception {
		return myDAO.srchCommentList(sStr);
	}

}
