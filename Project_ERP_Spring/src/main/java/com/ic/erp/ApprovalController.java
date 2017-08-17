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
import dao.UserDao;
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
	
}