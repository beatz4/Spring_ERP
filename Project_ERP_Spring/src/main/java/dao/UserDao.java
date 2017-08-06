package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.UserVo;

public class UserDao {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<UserVo> selectList() {

		List<UserVo> list = null;

		// 2.�۾�����
		list = sqlSession.selectList("user_list");

		return list;
	}
	
	public List<UserVo> selectList(int c_idx) {
		
		List<UserVo> list = null;

		// 2.�۾�����
		list = sqlSession.selectList("c_user_list", c_idx);

		return list;
	}

	// idx�� �ش�Ǵ� �Խù� 1�� ������
	public UserVo selectOne(Map map) {

		UserVo vo = null;

		// 2.�۾�����
		vo = sqlSession.selectOne("user_selectOne", map);

		return vo;
	}
	
	// idx�� �ش�Ǵ� �Խù� 1�� ������
	public UserVo selectOne(int idx) {

		UserVo vo = null;

		// 2.�۾�����
		vo = sqlSession.selectOne("selectOne", idx);

		return vo;
	}

	// message���� �� ���� ���̵� �ش��ϴ� ���� ��������
	public UserVo selectOne_recv_id(String recv_id) {

		UserVo vo = null;

		// 2.�۾�����
		vo = sqlSession.selectOne("recv_id_selectOne", recv_id);

		return vo;
	}

	public int insert(UserVo vo) {
		int res = 0;

		// 2.�۾�����
		res = sqlSession.insert("insert_user", vo);

		return res;
	}

	public List<UserVo> selectList_popup(Map map) {
		List<UserVo> list = null;

		// 2.�۾�����
		list = sqlSession.selectList("popup_condition_list", map);

		return list;
	}

	public int popup_RowTotal() {

		int total = 0;

		total = sqlSession.selectOne("popup_row_total");

		return total;
	}

	public int delete(List list) {
		// TODO Auto-generated method stub

		int res = 0;

		res = sqlSession.delete("user_delete", list);

		return res;
	}

}
