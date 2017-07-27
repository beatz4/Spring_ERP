package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.MainMenuVo;

public class MainMenuDao {

	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MainMenuVo> selectList(boolean isAdmin) {

		List<MainMenuVo> list = null;

		// 2.작업수행
		list = sqlSession.selectList("main_menu_list");
		
		// 관리자 모드 여부 판별
		if( !isAdmin )
			list.remove( list.size() - 1 );

		return list;
	}

}
