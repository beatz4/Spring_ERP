package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.MessageVo;

public class MessageDao {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<MessageVo> selectList(String recv_id) {

		List<MessageVo> list = null;

		list = sqlSession.selectList("message_list", recv_id);

		return list;
	}
	
	public List<MessageVo> selectList(Map map) {

		List<MessageVo> list = null;

		list = sqlSession.selectList("message_condition_list", map);
		
		return list;
	}
	
	public List<MessageVo> selectList_send(String send_id) {

		List<MessageVo> list = null;

		list = sqlSession.selectList("message_send_list", send_id);
	
		return list;
	}
	
	public List<MessageVo> selectList_send(Map map) {

		List<MessageVo> list = null;

		list = sqlSession.selectList("message_send_condition_list", map);
	
		return list;
	}
	
	public List<MessageVo> selectList_box(String recv_id) {

		List<MessageVo> list = null;

		list = sqlSession.selectList("message_box_list", recv_id);
	
		return list;
	}
	
	public List<MessageVo> selectList_box(Map map) {

		List<MessageVo> list = null;

		list = sqlSession.selectList("message_box_condition_list", map);
	
		return list;
	}
	
	public MessageVo selectOne(int idx) {

		MessageVo vo = null;

		vo = sqlSession.selectOne("message_selectOne", idx);
	
		return vo;
	}
	
	public int message_insert(MessageVo vo){
		int res = 0;

		res = sqlSession.insert("message_insert", vo);
	
		return res;
	}
	
	public int message_send_insert(MessageVo vo){
		int res_send = 0;
	
		res_send = sqlSession.insert("message_send_insert", vo);
	
		return res_send;
	}
	
	public int msg_update_state(Map map){
	    int res = 0;
	
	    res = sqlSession.update("message_state", map);
		
	    return res;
	}
	
	public int msg_send_update_state(Map map){
	    int res = 0;
	
	    res = sqlSession.update("message_send_state", map);
		
	    return res;
	}

	public int delete(int idx) {
		int res = 0;

		res = sqlSession.delete("message_delete", idx);
	
		return res;
	}

	public int box_update(int idx) {
		int res = 0;
	
		res = sqlSession.update("message_box_move", idx);
	
		return res;
	}

	public int Msg_send_delete(int idx) {
		int res = 0;
	
		res = sqlSession.delete("message_send_delete", idx);
	
		return res;
	}

	public int message_RowTotal(Map map) {
		int total = 0;
	
		total = sqlSession.selectOne("message_row_total", map);
	
		return total;
	}
	
	public int message_send_RowTotal(Map map) {
		int total = 0;
	
		total = sqlSession.selectOne("message_send_row_total", map);
	
		return total;
	}

	public int message_box_RowTotal(Map map) {
		int total = 0;
	
		total = sqlSession.selectOne("message_box_row_total", map);
	
		return total;
	}

	public int message_recv_count(String recv_id){
		int total = 0;
		
		total = sqlSession.selectOne("message_recv_count", recv_id);
		
		return total;
		
	}
	
}
