package com.ic.erp;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.FileBoardDao;
import dao.UserDao;
import vo.FileBoardVo;

@Controller
public class FileBoardController {

	final static String VIEW_PATH = "/WEB-INF/views/FileBoard/";
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext application;
	
	FileBoardDao file_dao;
	UserDao user_dao;
	public FileBoardDao getFile_dao() {
		return file_dao;
	}
	public void setFile_dao(FileBoardDao file_dao) {
		this.file_dao = file_dao;
	}
	public UserDao getUser_dao() {
		return user_dao;
	}
	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
	@RequestMapping("/FileBoard/file_board.do")
	public String file_list(Model model){
		
		List<FileBoardVo> list = file_dao.selectList();
		
		model.addAttribute("list", list);
		
		return VIEW_PATH+"file_list.jsp";
	}
	
}
