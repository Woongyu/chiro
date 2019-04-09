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
	public List<Map<String, Object>> srchMemberList(Map<String, Object> map) throws Exception {
		return myDAO.srchMemberList(map);
	}
	
	@Override
	public Map<String, Object> srchMemberDetail(String sStr) throws Exception {
		return myDAO.srchMemberDetail(sStr);
	}

	@Override
	public Object delUser(String sStr) throws Exception {
		return myDAO.delUser(sStr);
	}

	@Override
	public List<Map<String, Object>> srchNoticeList(CommandMap map) throws Exception {
		return myDAO.srchNoticeList(map);
	}

	@Override
	public Object insNotice(Map<String, Object> map) throws Exception {
		return myDAO.insNotice(map);
	}

	@Override
	public void updNoticeHit(String sStr) throws Exception {
		myDAO.updNoticeHit(sStr);
	}

	@Override
	public Map<String, Object> srchBoardDetail(String sStr) throws Exception {
		return myDAO.srchBoardDetail(sStr);
	}

	@Override
	public Object delNotice(String sStr) throws Exception {
		return myDAO.delNotice(sStr);
	}

	@Override
	public Object updNotice(Map<String, Object> map) throws Exception {
		return myDAO.updNotice(map);
	}

}
