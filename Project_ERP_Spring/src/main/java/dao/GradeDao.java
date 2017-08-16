package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GradeVo;

public class GradeDao {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<GradeVo> selectList() {

		List<GradeVo> list = null;

		// 2.작업수행
		list = sqlSession.selectList("grade_list");

		return list;
	}
	
	public int insert( GradeVo vo ) {
		int res = 0;
		res = sqlSession.insert("grade_insert", vo);
		return res;
	}

	public GradeVo selectOne(int idx) {
		// TODO Auto-generated method stub
		GradeVo vo = null;
		vo = sqlSession.selectOne("grade_one", idx);
		return vo;
	}
}
