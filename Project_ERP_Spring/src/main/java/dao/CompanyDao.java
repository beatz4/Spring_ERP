/*
炼流 备己 Dao 
 */

package dao;

import java.util.List;
import java.util.Map;

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
	
	public CompanyVo selectOne(Map map) {
		CompanyVo vo = null;
		vo = sqlSession.selectOne("company_one", map);
		return vo;
	}
	
	public int insert( CompanyVo vo ) {
		int res = 0;
		res = sqlSession.insert("company_insert", vo);
		return res;
	}
	
	public int update( CompanyVo vo ) {
		int res = 0;
		res = sqlSession.update("company_update", vo);
		return res;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		int res = 0;
		res = sqlSession.delete("company_delete", id);
		return res;
	}

}
