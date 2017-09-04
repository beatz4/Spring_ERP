package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CompanyVo;
import vo.UserVo;
import vo.approval.App_DocVo;
import vo.approval.App_ExpenseVo;
import vo.approval.App_Expense_ContentVo;
import vo.approval.App_LineViewVo;
import vo.approval.App_LineVo;
import vo.approval.Doc_TypeVo;

public class ApprovalDao {
	
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Doc_TypeVo> doc_selectlist() {
		// TODO Auto-generated method stub
		
		List<Doc_TypeVo> list = null;
		
		list = sqlSession.selectList("selectlist_doc");
		
		return list;
	}

	public List<App_ExpenseVo> selectlist_expense_type() {
		// TODO Auto-generated method stub
		List<App_ExpenseVo> list;
		
		list = sqlSession.selectList("list_app_type");
		
		return list;
	}

	public List<CompanyVo> company_select() {
		// TODO Auto-generated method stub
		List<CompanyVo> list = null;
		
		list = sqlSession.selectList("company_select");
		
		return list;
	}

	public List<UserVo> company_select(int idx) {
		// TODO Auto-generated method stub
		List<UserVo> list = null;
		
		list = sqlSession.selectList("company_user_list", idx);
		
		return list;
	}

	public UserVo select_user_one(int idx) {
		// TODO Auto-generated method stub
		UserVo vo = null;
		
		vo = sqlSession.selectOne("app_check_one", idx);
		
		return vo;
	}

	public int app_insert_line(Map map) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("app_line_insert", map);
		
		return res;
	}

	//user 결재선 목록
	public List<App_LineVo> app_line_list(int idx) {
		// TODO Auto-generated method stub
		List<App_LineVo> list = null;
		
		list = sqlSession.selectList("app_line_list", idx);
		
		return list;
	}

	public App_LineViewVo app_line_select_one(int a_line_idx) {
		// TODO Auto-generated method stub
		App_LineViewVo vo = null;
		
		vo = sqlSession.selectOne("app_line_select_one", a_line_idx);
		
		return vo;
	}

	public int app_update_line(Map map) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.update("app_line_update", map);
		
		return res;
	}

	public int insert_expense(App_ExpenseVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("app_expense", vo);
		
		return res;
	}

	public int insert_expense_content(App_Expense_ContentVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = sqlSession.insert("app_expense_content", vo);
		
		return res;
	}

	/*public List<UserVo> selectlist_expense(int idx) {
		// TODO Auto-generated method stub
		List<UserVo> list ;
		
		list = sqlSession.selectOne("app_user_list", idx);
		
		return list;
	}*/
	
	
}
