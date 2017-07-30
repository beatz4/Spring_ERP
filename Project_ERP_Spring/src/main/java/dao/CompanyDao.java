/*
炼流 备己 Dao 
 */

package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CompanyVo;

public class CompanyDao {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CompanyVo> selectList() {
		// TODO Auto-generated method stub
		
		List<CompanyVo> list = null;

		// 2.累诀荐青
		list = sqlSession.selectList("company_list");

		return list;
	}
	
	

}
