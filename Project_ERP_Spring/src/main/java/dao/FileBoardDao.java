package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FileBoardVo;

public class FileBoardDao {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<FileBoardVo> selectList(){
		
		List<FileBoardVo> list = null;
		
		list = sqlSession.selectList("file_list");
		
		return list;
	}
	
}
