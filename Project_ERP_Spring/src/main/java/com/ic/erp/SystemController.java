/*
System 메뉴 Servlet은 이곳에 모두 머지 시킨다.
 */

package com.ic.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CompanyDao;
import dao.GradeDao;
import dao.UserDao;
import vo.CompanyVo;
import vo.GradeVo;
import vo.UserVo;

@Controller
public class SystemController {

	final static String VIEW_PATH = "/WEB-INF/views/SystemAdmin/";
	
	@Autowired
	HttpServletRequest request;

	UserDao user_dao; // 유저 정보
	GradeDao grade_dao; // 직급 정보
	CompanyDao company_dao; // 조직 정보

	public UserDao getUser_dao() {
		return user_dao;
	}

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}

	public GradeDao getGrade_dao() {
		return grade_dao;
	}

	public void setGrade_dao(GradeDao grade_dao) {
		this.grade_dao = grade_dao;
	}

	public CompanyDao getCompany_dao() {
		return company_dao;
	}

	public void setCompany_dao(CompanyDao company_dao) {
		this.company_dao = company_dao;
	}

	@RequestMapping("/SystemAdmin/user_manager.do")
	public String user_list(Model model) {

		List<UserVo> list = user_dao.selectList();
		model.addAttribute("list", list);

		return VIEW_PATH + "user_manage.jsp";
	}
	
	@RequestMapping("/SystemAdmin/company_organize.do")
	public String company_list(Model model) {

		List<CompanyVo> list = company_dao.selectList();
		model.addAttribute("list", list);

		return VIEW_PATH + "company_organize.jsp";
	}

	@RequestMapping("/SystemAdmin/delete.do")
	@ResponseBody
	public String user_delete(@RequestParam(value="index",required=true) List<String> list) {

		// 받아온 index list를 넘겨준다
		int res = user_dao.delete(list);

		String result = "ng";
		if (res > 0) {
			result = res + "";
		}

		return result;
	}
	
	@RequestMapping(value="/SystemAdmin/company_list.do",produces="text/html;charset=utf-8")
	@ResponseBody
	public String company_list( ) {
		List<CompanyVo> c_list = company_dao.selectList();
		
		StringBuffer sb = new StringBuffer("[");
		for(CompanyVo vo : c_list){
			
			// 상부 부서 index + 현재 부서 index
			String str_id = "" + vo.getParent_idx() + vo.getIdx();
			int id = Integer.parseInt(str_id);
			int pId = vo.getParent_idx();
			boolean open = true;
			boolean drag = pId==0 ? false : true;
			
			// String jsonTxt = "{\"code\":\"200\", \"msg\":\"success\"}";
			String str = String.format("{ \"id\" :" 
										+ id 					// integer type
										+ ", \"pId\" : "
										+ pId					// integer type
										+ ", \"name\" : "
										+ "\"%s\""
										+ ", \"open\" : "
										+ open
										+ ", \"drag\" : "
										+ drag 
										+ " } ,"			// string type
										, vo.getName() );
			sb.append(str);
		}
        
		int length = sb.toString().length();
		String result = sb.toString().substring(0, length-1);
		result += "]";
		return result;
	}
	
	@RequestMapping("/SystemAdmin/user_register_form.do")
	public String user_register_form( Model model ) {
		
		List<GradeVo> list = grade_dao.selectList();
		model.addAttribute("list", list);
		
		return VIEW_PATH + "user_register_form.jsp";
	}
	
	// 아이디 중복 체크
	@RequestMapping("/SystemAdmin/check_id.do")
	@ResponseBody
	public String check_id( String id ) {
		
		Map map = new HashMap();
		map.put("id", id);
		
		UserVo vo = user_dao.selectOne(map);
		
		String result = "ng";
		if( vo == null ) {
			result = "ok";
		}
		
		return result;
	}
	
	@RequestMapping("/SystemAdmin/user_register.do")
	@ResponseBody
	public String user_register(UserVo vo, String groupname) {

		// 소속 그룹 idx mapping
		CompanyVo c_vo = company_dao.selectOne(groupname);
		vo.setC_idx(c_vo.getIdx());
		
		int res = user_dao.insert(vo);
		
		String result = "ng";
		if( res != 0 ) {
			result = "ok";
		}
		
		return result;
	}
}
