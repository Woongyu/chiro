package com.ch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ch.vo.CommandMap;

@Repository("myDAO")
public class MyDAO extends AbstractDAO {
	
	public Object insUser(Map<String, Object> map) throws Exception {
		return insert("ch.insUser", map);
	}
	
	public Object updUser(Map<String, Object> map) {
		return update("ch.updUser", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> srchMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("ch.srchMemberList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> srchMemberDetail(String sStr) throws Exception {
		return (Map<String, Object>) selectOne("ch.srchMemberDetail", sStr);
	}

	public Object delUser(String sStr) throws Exception {
		return update("ch.delUser", sStr);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> srchNoticeList(CommandMap map) throws Exception {
		return (List<Map<String, Object>>) selectList("ch.srchNoticeList", map);
	}

	public Object insNotice(Map<String, Object> map) throws Exception {
		return insert("ch.insNotice", map);
	}

	public void updNoticeHit(String sStr) throws Exception{
		update("ch.updNoticeHit", sStr);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> srchBoardDetail(String sStr) throws Exception{
		return (Map<String, Object>) selectOne("ch.srchBoardDetail", sStr);
	}

	public Object delNotice(String sStr) throws Exception{
		return update("ch.delNotice", sStr);
	}

	public Object updNotice(Map<String, Object> map) throws Exception {
		return update("ch.updNotice", map);
	}

}
