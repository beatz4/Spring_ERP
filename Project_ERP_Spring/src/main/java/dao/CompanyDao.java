/*
���� ���� Dao 
 */

package dao;

import org.apache.ibatis.session.SqlSession;


public class CompanyDao {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	

}
