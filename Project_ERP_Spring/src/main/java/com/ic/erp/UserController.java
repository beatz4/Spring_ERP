package com.ic.erp;

import org.springframework.stereotype.Controller;

import dao.UserDao;

@Controller
public class UserController {

	final static String VIEW_PATH = "/WEB-INF/views/";
	
	UserDao user_dao;

	public UserDao getUser_dao() {
		return user_dao;
	}

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
	
	
}
