package com.ic.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		List<CompanyVo> list = app_dao.company_select();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"/approval_line.jsp";
	}
	
	
	@RequestMapping("/Approval/approval_line_list.do")
	@ResponseBody
	public List approval_line_list(int idx){
		
		List<UserVo> list = app_dao.company_select(idx);
		List<UserVo> user_list = new ArrayList<UserVo>();
		
		for(UserVo vo : list){
			vo = new UserVo(vo.getIdx(), vo.getG_idx(), vo.getName(), vo.getG_position(), vo.getG_level(), vo.getC_name(), vo.getC_idx());
			user_list.add(vo);
			
		}
		
		return user_list;
		
	}
	
	@RequestMapping("/Approval/check_line.do")
	@ResponseBody
	public List check_line(int idx, int idx_check, Model model){
		
		String result = "ok";
		UserVo vo = app_dao.select_user_one(idx);
		List<UserVo> user = new ArrayList<UserVo>();
		
		if(idx_check != 0){
			/*int idx_ckeck_int=Integer.parseInt(idx_check);*/
			UserVo check_vo = app_dao.select_user_one(idx_check);
			
			if(vo.getG_level() < check_vo.getG_level()){
				result = "nok";
			
			}else if(vo.getG_level() >= check_vo.getG_level()){
				result = "ok";
				
			}
		}
		
		vo = new UserVo(result,vo.getIdx(), vo.getG_idx(), vo.getName(), vo.getG_position(), vo.getG_level(), vo.getC_idx(), vo.getC_name());
		user.add(vo);
		
		return user;
		
	}
	@RequestMapping("/Approval/app_line_insert.do")
	@ResponseBody
	public String app_line_insert(App_LineVo vo, HttpSession session){
		
		UserVo user_vo = (UserVo)session.getAttribute("user");

		Map map = new HashMap();
		map.put("idx", user_vo.getIdx());
		map.put("idx_one", vo.getIdx_one());
		map.put("idx_two", vo.getIdx_two());
		map.put("idx_three", vo.getIdx_three());
		map.put("idx_four", vo.getIdx_four());
		map.put("a_line_name", vo.getA_line_name());
		
		int res = app_dao.app_insert_line(map);
		
		String result ="success";
		if(res == -1){
			result = "fail";
		}
		return result;
	}
	
	
}
