package com.ic.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MainMenuDao;
import dao.MessageDao;
import dao.UserDao;
import define.DefineType;
import vo.MainMenuVo;
import vo.MessageVo;
import vo.UserVo;

@Controller
public class MainMenuController {

	final static String VIEW_PATH = "/WEB-INF/views/main/";
	
	MainMenuDao mainmenu_dao;
	UserDao user_dao;
	MessageDao message_dao;

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext application;

	public UserDao getUser_dao() {
		return user_dao;
	}

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}

	public MainMenuDao getMainmenu_dao() {
		return mainmenu_dao;
	}

	public void setMainmenu_dao(MainMenuDao mainmenu_dao) {
		this.mainmenu_dao = mainmenu_dao;
	}
	
	public MessageDao getMessage_dao() {
		return message_dao;
	}

	public void setMessage_dao(MessageDao message_dao) {
		this.message_dao = message_dao;
	}

	
	//로그인
	@RequestMapping("/main/login.do")
	public String login(){
		
		request.getSession().removeAttribute("user");
		
		return VIEW_PATH+"login.jsp";
	}
	
	//로그인체크
	@RequestMapping("/main/check_login.do")
	@ResponseBody
	public String login_check(HttpServletResponse response, String id, String password, String saveId){
		
		Cookie cookie = null;
		
		if(saveId.equals("true")){
			cookie = new Cookie("id", java.net.URLEncoder.encode(id));
			cookie.setMaxAge(60*60*24*365);
			cookie.setPath("/");
			response.addCookie(cookie);
		}else{
			cookie = new Cookie("id", null);
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		String result = "ok";
		
		Map map = new HashMap();
		map.put("id", id);
		// ID 검사
		UserVo vo = user_dao.selectOne(map);
		if (vo == null) {
			result = "id_ng";
		} else {
			map.put("password", password);	
			vo = user_dao.selectOne(map);
			if (vo == null) {
				result = "pw_ng";
			} else {
				// session에 user 저장
				session.setAttribute("user", vo);
			}
		}
		
		return result;
	}
	
	//메인메뉴
	@RequestMapping("/main/main.do")
	public String main_menu(HttpServletRequest request){
		
		UserVo user = (UserVo)session.getAttribute("user");
		
		int new_msg = message_dao.message_recv_count(user.getId());
		session.setAttribute("new_msg", new_msg);
		
		if( user == null ) {
			return null;
		}

		// 메뉴 정보
		boolean isAdminID = false;
		// 관리자 접속 모드
		if( user.getId().equalsIgnoreCase(DefineType.adminID) )
			isAdminID = true;
		
		List<MainMenuVo> list = mainmenu_dao.selectList(isAdminID);
		
		return VIEW_PATH+"main.jsp";
	}
	
}
