package com.ic.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import vo.approval.App_LineViewVo;
import vo.approval.App_LineVo;
import vo.approval.Doc_TypeVo;

@Controller
public class ApprovalController {
	
	final static String VIEW_PATH = "/WEB-INF/views/Approval/";
	
	@Autowired
	HttpSession session;
	
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
	public String insert_form(int doc_idx, Model model){
		
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
	
	//지출결의서 form 에서 content 추가
	@RequestMapping(value ="/Approval/insert_content.do", produces="text/html;charset=utf-8")
	public String insert_content(Model model){
		
		List<App_ExpenseVo> list = app_dao.selectlist_expense_type();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"approval_form/expense_content.jsp";
	}
	
	//지출결의서 main data_insert
	@RequestMapping("/Approval/expense_insert.do")
	@ResponseBody
	public int expense_insert(Model model, App_ExpenseVo vo, HttpServletRequest request){
		
		/*System.out.println(vo.getD_expense_total());*/
		
		vo.setIp(request.getRemoteAddr());
		
		int res = app_dao.insert_expense(vo);
		
		int d_expense_idx = 0;
		
		if(res == 1){
			
			d_expense_idx = vo.getD_expense_idx();
		}
		
		return d_expense_idx;
	}
	
	//지출결의서 중 content_insert
	@RequestMapping("/Approval/expense_content_insert.do")
	@ResponseBody
	public int expense_content(Model model, App_Expense_ContentVo vo){
		
		System.out.println(vo.getD_expense_idx());
		
		int res = app_dao.insert_expense_content(vo);
		
		return res;
	}
	
	//결재 요청, 대기, 완료, 반려 리스트
	@RequestMapping("/Approval/expense_list.do")
	public String waiting_expense(Model model, int d_condition, String result){
		
		UserVo user = (UserVo)session.getAttribute("user");
		
		int idx = user.getIdx();
		
		List<App_ExpenseVo> list = app_dao.app_expense_list();
		
		List<App_ExpenseVo> d_condition_list = new ArrayList<App_ExpenseVo>();
		
		for(App_ExpenseVo vo : list){
				
			if(vo.getIdx() == idx || vo.getNext_idx() == idx){
					
				if(d_condition == 1){
						
					if(vo.getIdx() == idx && result.equals("request")){
							
						d_condition_list = app_dao.app_d_condition_list(d_condition);
							
					}else if(vo.getNext_idx() == idx && result.equals("wating")){
							
						Map map = new HashMap();
						map.put("d_condition", d_condition);
						map.put("next_idx", idx);
						d_condition_list = app_dao.app_d_wationg_list(map);
						
					}
						
				}else if(d_condition == 2){
						
					d_condition_list = app_dao.app_d_condition_list(d_condition);
					
				}else if(d_condition == 3){
					
					d_condition_list = app_dao.app_d_condition_list(d_condition);
					
				}
				
			}else{
					
				d_condition_list = null;
					
			}
					
		}
		
		model.addAttribute("list", d_condition_list);
		
		return VIEW_PATH+"/approval_form/app_list.jsp";
	}
	
	//결재 요청, 대기, 반려, 완료 내용 보기
	@RequestMapping("/Approval/app_expense_index.do")
	public String app_expense_index(int d_expense_idx, Model model){
		
		App_ExpenseVo vo = app_dao.app_expense_index(d_expense_idx);
		
		model.addAttribute("vo", vo);
		
		List<App_Expense_ContentVo> list = app_dao.app_expense_content(d_expense_idx);
		
		model.addAttribute("content_vo", list);
		
		App_LineViewVo line_vo = app_dao.app_line_select_one(vo.getApp_d_idx());
		
		model.addAttribute("line_vo", line_vo);
		
		return VIEW_PATH+"/approval_form/app_expense_index.jsp";
	}
	
	
	//결재선 Controller
	@RequestMapping("/Approval/app_line.do")
	public String app_line(Model model){	
		
		UserVo vo = (UserVo) session.getAttribute("user");
		
		int idx = vo.getIdx();
		
		List<App_LineVo> list = app_dao.app_line_list(idx);
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"/approval_line_list.jsp";
	}
	
	@RequestMapping("/Approval/app_line_index.do")
	public String app_line_index(Model model){	
		
		UserVo vo = (UserVo) session.getAttribute("user");
		
		int idx = vo.getIdx();
		
		List<App_LineVo> list = app_dao.app_line_list(idx);
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"/approval_form/approval_index_line_list.jsp";
	}
	
	
	@RequestMapping(value ="/Approval/insert_app_line.do", produces="text/html;charset=utf-8")
	public String insert_app_line(Model model){
		
		List<CompanyVo> list = app_dao.company_select();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"/approval_line.jsp";
	}
	
	
	@RequestMapping("/Approval/approval_line.do")
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
	public List check_line(int idx, int idx_check_front, int idx_check_back, Model model){
		
		String result = "ok";
		UserVo vo = app_dao.select_user_one(idx);
		List<UserVo> user = new ArrayList<UserVo>();
		
		if(idx_check_front != 0){
			/*int idx_ckeck_int=Integer.parseInt(idx_check);*/
			UserVo check_vo = app_dao.select_user_one(idx_check_front);
			
				if(vo.getG_level() < check_vo.getG_level()){
					result = "nok";
				
				}else{
					
					if(idx_check_back != 0){
						UserVo check_vo_back = app_dao.select_user_one(idx_check_back);
						
						if(vo.getG_level() > check_vo_back.getG_level()){
							result="bnok";
						}else{
							result="ok";
						}
						
					}else{
						result="ok";
					}
			
				}
				
		}
		
		vo = new UserVo(result,vo.getIdx(), vo.getG_idx(), vo.getName(), vo.getG_position(), vo.getG_level(), vo.getC_idx(), vo.getC_name());
		user.add(vo);
		
		return user;
		
	}
	
	@RequestMapping("/Approval/app_line_insert.do")
	@ResponseBody
	public String app_line_insert(App_LineVo vo){
		
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
	
	@RequestMapping(value ="/Approval/app_line_mod_form.do", produces="text/html;charset=utf-8")
	public String app_line_mod(Model model, int a_line_idx){
		
		List<CompanyVo> list = app_dao.company_select();
		
		model.addAttribute("list", list);
		
		App_LineViewVo vo = app_dao.app_line_select_one(a_line_idx);
		
		model.addAttribute("vo", vo);
		
		return VIEW_PATH+"/approval_line_modify.jsp";
	}
	
	@RequestMapping(value ="/Approval/app_line_mod.do", produces="text/html;charset=utf-8")
	@ResponseBody
	public String app_line_modify(App_LineVo vo){

		Map map = new HashMap();
		map.put("a_line_idx", vo.getA_line_idx());
		map.put("idx_one", vo.getIdx_one());
		map.put("idx_two", vo.getIdx_two());
		map.put("idx_three", vo.getIdx_three());
		map.put("idx_four", vo.getIdx_four());
		map.put("a_line_name", vo.getA_line_name());
		
		int res = app_dao.app_update_line(map);
		
		String result ="success";
		if(res == -1){
			result = "fail";
		}
		return result;
	}
	
	@RequestMapping("/Approval/index_line_insert.do")
	@ResponseBody
	public List index_line_insert(int a_line_idx){
		
		App_LineViewVo vo = app_dao.app_line_select_one(a_line_idx);
		
		List<App_LineViewVo> list = new ArrayList<App_LineViewVo>();
		
		list.add(vo);
		
		return list;
	}
	
	
	
}
