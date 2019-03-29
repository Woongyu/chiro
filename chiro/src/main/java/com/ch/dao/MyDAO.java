package com.ch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ch.vo.CommandMap;

@Repository("myDAO")
public class MyDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) {
		return (List<Map<String, Object>>) selectList("ch.selectBoardList", commandMap);
	}

	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("ch.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("ch.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("ch.selectBoardDetail", map);
	}

	public void insUser(Map<String, Object> map) {
		insert("ch.insUser", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(CommandMap map) {
		return (List<Map<String, Object>>) selectList("ch.selectMemberList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberDetail(String sStr) {
		return (Map<String, Object>) selectOne("ch.selectMemberDetail", sStr);
	}

}
