package com.ch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ch.util.Utlz;
import com.ch.vo.CommandMap;

@Repository("myDAO")
public class MyDAO extends AbstractDAO {
	
	public Object insUser(Map<String, Object> map) throws Exception {
		return insert("member.insUser", map);
	}
	
	public Object updUser(Map<String, Object> map) {
		return update("member.updUser", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> srchUserList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("member.srchUserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> srchUserDetail(String sStr) throws Exception {
		return (List<Map<String, Object>>) selectList("member.srchUserDetail", sStr);
	}

	public Object delUser(String sStr) throws Exception {
		return update("member.delUser", sStr);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> srchBoardList(Map<String, Object> map) throws Exception {
		if(!Utlz.isBlank((String) map.get("BOARD_LIKE"))){
			return (List<Map<String, Object>>) selectPagingList("board.srchBoardLike", map);
		}else{
			return (List<Map<String, Object>>) selectPagingList("board.srchBoardList", map);
		}
	}

	public Object insBoard(Map<String, Object> map) throws Exception {
		return insert("board.insBoard", map);
	}

	public void updBoardHit(String sStr) throws Exception{
		update("board.updBoardHit", sStr);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> srchBoardDetail(String sStr) throws Exception{
		return (Map<String, Object>) selectOne("board.srchBoardDetail", sStr);
	}

	public Object delBoard(String sStr) throws Exception{
		return update("board.delBoard", sStr);
	}

	public Object updBoard(Map<String, Object> map) throws Exception {
		return update("board.updBoard", map);
	}

	public Object insComment(Map<String, Object> map) throws Exception {
		return insert("board.insComment", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> srchCommentList(String sStr) throws Exception{
		return (List<Map<String, Object>>) selectList("board.srchCommentList", sStr);
	}

}
