package com.ic.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ApprovalDao;
import dao.CompanyDao;
import dao.UserDao;
import vo.CompanyVo;
import vo.GradeVo;
import vo.UserVo;
import vo.approval.App_DocVo;
import vo.approval.App_ExpenseVo;
import vo.approval.App_Expense_ContentVo;
import vo.approval.App_LineVo;
import vo.approval.Doc_TypeVo;

@Controller
public class ApprovalController {
	
	final static String VIEW_PATH = "/WEB-INF/views/Approval/";
	
	ApprovalDao app_dao;
	
	public ApprovalDao getApp_dao() {
		return app_dao;
	}

	public void setApp_dao(ApprovalDao app_dao) {
		this.app_dao = app_dao;
	}
	
	UserDao user_dao;

	public UserDao getUser_dao() {
		return user_dao;
	}

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
	CompanyDao company_dao;
	
	public CompanyDao getCompany_dao() {
		return company_dao;
	}

	public void setCompany_dao(CompanyDao company_dao) {
		this.company_dao = company_dao;
	}

	@RequestMapping("/Approval/main_page.do")
	public String main(){
		
		return VIEW_PATH+"approval_main_page.jsp";
		
	}
	
	@RequestMapping("/Approval/doc_type.do")
	public String doc_type(Model model){
		
		List<Doc_TypeVo> list = app_dao.doc_selectlist();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"document_type.jsp";
	}
	
	@RequestMapping("/Approval/insert_form.do")
	public String insert_form(int doc_idx, Model model, HttpSession session){
		
		if(doc_idx==1){
			UserVo user = (UserVo)session.getAttribute("user");
			
			int idx = user.getIdx();
					
			UserVo uservo  = user_dao.selectOne(idx);
			
			List<App_ExpenseVo> list = app_dao.selectlist_expense_type();
			
			model.addAttribute("app_user_list", uservo);
			model.addAttribute("list", list);
		}
		
		return VIEW_PATH+"approval_insert_form.jsp";
	}
	
	@RequestMapping(value ="/Approval/insert_content.do", produces="text/html;charset=utf-8")
	public String insert_content(Model model){
		
		List<App_ExpenseVo> list = app_dao.selectlist_expense_type();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"approval_form/expense_content.jsp";
	}
	
	@RequestMapping("/Approval/expense_content_insert.do")
	public String expense_content(Model model, App_Expense_ContentVo vo){
		
		return "redirect:insert_form.do?doc_idx=1";
	}
	
	@RequestMapping("/Approval/expense_insert.do")
	public String expense_insert(Model model, App_Expense_ContentVo vo){
		
		return "redirect:insert_form.do?doc_idx=1";
	}
	
	@RequestMapping(value ="/Approval/insert_app_line.do", produces="text/html;charset=utf-8")
	public String insert_app_line(Model model){
		
		List<CompanyVo> list = company_dao.selectList();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"approval_form/approval_line.jsp";
	}
	
	@RequestMapping(value = "/Approval/company_line_list.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String company_ListToTree() {
		List<CompanyVo> c_list = company_dao.selectList();

		StringBuffer sb = new StringBuffer("[");
		for (CompanyVo vo : c_list) {

			// 상부 부서 index + 현재 부서 index
			int id = vo.getId();
			int pId = vo.getParent_idx();

			boolean isParent = (vo.isParent() == 0) ? false : true;
			boolean open = true;
			boolean drag = pId == 0 ? false : true;

			// String jsonTxt = "{\"code\":\"200\", \"msg\":\"success\"}";
			String str = String.format(
					"{ \"id\" :" + id // integer type
							+ ", \"pId\" : " + pId // integer type
							+ ", \"name\" : " + "\"%s\"" + ", \"open\" : " + open + ", \"drag\" : " + drag
							+ ", \"isParent\" : " + isParent + " } ," // string
																		// type
					, vo.getName());

			sb.append(str);
		}

		int length = sb.toString().length();
		String result = sb.toString().substring(0, length - 1);
		result += "]";
		return result;
	}

	@RequestMapping(value = "/Approval/c_user_line_list.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String c_user_list(CompanyVo vo) {

		String result = "fail";

		if (vo == null)
			return result;

		String name = vo.getName();
		int id = vo.getId();

		if (name.isEmpty() || name == null) {
			return result;
		}

		Map map = new HashMap();
		map.put("name", name);
		map.put("id", id);

		// 소속 이름의 vo를 가져온다
		CompanyVo c_vo = company_dao.selectOne(map);
		if (c_vo == null)
			return result;

		// company vo로 해당 c_idx의 유저목록을 가져온다
		List<UserVo> c_user = user_dao.selectList(c_vo.getIdx());
		if (c_user == null || c_user.size() < 1)
			return result;

		int idx = 1;

		StringBuffer sb = new StringBuffer("[");
		for (UserVo u_vo : c_user) {

			// String jsonTxt = "{\"code\":\"200\", \"msg\":\"success\"}";
			String str = String.format(
					"{ \"id\" :" + idx // integer type
							+ ", \"pId\" : " + 0 // integer type
							+ ", \"name\" : " + "\"%s\"" + " } ," // string type
					, u_vo.getName());
			sb.append(str);
			idx++;
		}

		/*
		 * String desc = c_vo.getDescription(); System.out.println(desc);
		 * model.addAttribute("desc", desc);
		 */

		int length = sb.toString().length();
		result = sb.toString().substring(0, length - 1);
		result += "]";

		return result;
	}
	
}
