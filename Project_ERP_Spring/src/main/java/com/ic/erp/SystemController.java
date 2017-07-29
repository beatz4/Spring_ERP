/*
System 메뉴 Servlet은 이곳에 모두 머지 시킨다.
 */

package com.ic.erp;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CompanyDao;
import dao.GradeDao;
import dao.UserDao;

@Controller
public class SystemController {

	final static String VIEW_PATH = "/WEB-INF/views/SystemAdmin/";

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

		/*List<UserVo> list = user_dao.selectList();
		model.addAttribute("list", list);
*/
		
		System.out.println("manager page");
		
		return VIEW_PATH + "user_manage.jsp";
	}

	@RequestMapping("/SystemAdmin/delete.do")
	public String user_delete() {

		/*List<String> list = new ArrayList<String>();
		if( list_checked != null ) {
			for( int i=0; i < list_checked.length; ++i ) {
				String str = list_checked[i];
				list.add(str);
			}
		}
		
		System.out.println(list.size());

		int res = 0;
		// res = user_dao.delete(list);
		
		String result = "ng";
		if( res > 0 ) {
			result = res + "";
		}
		
		return result;*/
		
		return "redirect:user_manage.do";
	}
}
