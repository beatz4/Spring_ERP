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
}
