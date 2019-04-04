package com.ch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ch.vo.CommandMap;

@Repository("myDAO")
public class MyDAO extends AbstractDAO {
	
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("ch.updateHitCnt", map);
	}
	
	public void insUser(Map<String, Object> map) throws Exception {
		insert("ch.insUser", map);
	}
	
	public void updUser(Map<String, Object> map) {
		update("ch.updUser", map);		
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(CommandMap map) throws Exception {
		return (List<Map<String, Object>>) selectList("ch.selectMemberList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberDetail(String sStr) throws Exception {
		return (Map<String, Object>) selectOne("ch.selectMemberDetail", sStr);
	}

	public Object delUser(String sStr) throws Exception {
		return update("ch.delUser", sStr);
	}
	
}
