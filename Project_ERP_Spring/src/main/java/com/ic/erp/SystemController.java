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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.CompanyDao;
import dao.GradeDao;
import dao.UserDao;
import util.CompanyEditorFromJsonToVo;
import vo.CompanyVo;
import vo.CompanyVoArray;
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

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(CompanyVoArray.class, new CompanyEditorFromJsonToVo());
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
	public String user_delete(@RequestParam(value = "index", required = true) List<String> list) {

		// 받아온 index list를 넘겨준다
		int res = user_dao.delete(list);

		String result = "ng";
		if (res > 0) {
			result = res + "";
		}

		return result;
	}

	@RequestMapping(value = "/SystemAdmin/company_list.do", produces = "text/html;charset=utf-8")
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

	@RequestMapping(value = "/SystemAdmin/c_user_list.do", produces = "text/html;charset=utf-8")
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

	@RequestMapping("/SystemAdmin/user_register_form.do")
	public String user_register_form(Model model) {

		List<GradeVo> list = grade_dao.selectList();
		model.addAttribute("list", list);

		return VIEW_PATH + "user_register_form.jsp";
	}
	
	@RequestMapping("/SystemAdmin/modify_form.do")
	public String modify_form(Model model) {

		int id = Integer.parseInt(request.getParameter("index"));
		
		List<GradeVo> list = grade_dao.selectList();
		UserVo vo = user_dao.selectOne(id);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return VIEW_PATH + "user_modify_form.jsp";
	}

	// 아이디 중복 체크
	@RequestMapping("/SystemAdmin/check_id.do")
	@ResponseBody
	public String check_id(String id) {

		Map map = new HashMap();
		map.put("id", id);

		UserVo vo = user_dao.selectOne(map);

		String result = "ng";
		if (vo == null) {
			result = "ok";
		}

		return result;
	}

	@RequestMapping("/SystemAdmin/user_register.do")
	@ResponseBody
	public String user_register(UserVo vo, String groupname) {

		// 소속 그룹 idx mapping
		Map map = new HashMap();
		map.put("name", groupname);
		CompanyVo c_vo = company_dao.selectOne(map);
		vo.setC_idx(c_vo.getIdx());

		int res = user_dao.insert(vo);

		String result = "ng";
		if (res != 0) {
			result = "ok";
		}

		return result;
	}
	
	@RequestMapping("/SystemAdmin/user_modify.do")
	@ResponseBody
	public String user_modify(UserVo vo, String groupname) {
		
		// 소속 그룹 idx mapping
		Map map = new HashMap();
		map.put("name", groupname);
		CompanyVo c_vo = company_dao.selectOne(map);
		vo.setC_idx(c_vo.getIdx());
		
		map.clear();
		map.put("idx", vo.getIdx());
		
		int res = user_dao.update(vo);

		String result = "ng";
		if (res != 0) {
			result = "ok";
		}

		return result;
	}

	@RequestMapping("/SystemAdmin/company_save.do")
	@ResponseBody
	public String company_save(@RequestParam("json") CompanyVoArray json) {

		String result = "fail";

		if (json == null)
			return result;

		int res = 0;
		Map map = new HashMap();
		for (CompanyVo vo : json.getList_company()) {

			map.clear();
			map.put("id", vo.getId());
			CompanyVo vo_sel = company_dao.selectOne(map);

			if (vo_sel == null) {
				res = company_dao.insert(vo);
			} else {
				res = company_dao.update(vo);
			}
		}

		result = "" + res;
		return result;
	}

	@RequestMapping("/SystemAdmin/company_delete.do")
	@ResponseBody
	public String company_delete(int id) {

		String result = "fail";

		int res = 0;
		res = company_dao.delete(id);

		result = res + "";
		return result;
	}

	@RequestMapping("/SystemAdmin/position_manager.do")
	public String position_manager(Model model) {
		return VIEW_PATH + "position_manage.jsp";
	}
	
	@RequestMapping(value = "/SystemAdmin/position_list.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String position_list() {

		List<GradeVo> list = grade_dao.selectList();
		// json으로 포장
		StringBuffer sb = new StringBuffer("[");
		for (GradeVo vo : list) {

			// String jsonTxt = "{\"code\":\"200\", \"msg\":\"success\"}";
			String str = String.format(
					"{ \"name\" : \"%s\" } ," // string
					, vo.getG_position());

			sb.append(str);
		}

		int length = sb.toString().length();
		String result = sb.toString().substring(0, length - 1);
		result += "]";
		
		return result;
	}
	
	@RequestMapping(value = "/SystemAdmin/position_select.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String position_select(String name, Model model) throws JsonProcessingException {
		
		Map map = new HashMap();
		map.put("g_position", name);
		
		GradeVo vo = null;
		vo = grade_dao.selectOne(map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(vo);
		
		model.addAttribute("vo", vo);
		return json;
	}
	
	@RequestMapping("/SystemAdmin/insert_position.do")
	@ResponseBody
	public String position_insert( GradeVo vo ) {
		
		int res = 0;
		res = grade_dao.insert(vo);
		
		String result = res==0 ? "fail" : "success";
		return result;
	}
	
	@RequestMapping("/SystemAdmin/board_manager.do")
	public String board_manager(Model model) {

		return VIEW_PATH + "board_manage.jsp";
	}
}
