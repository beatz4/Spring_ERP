package com.ic.erp;

import org.springframework.stereotype.Controller;

import dao.GradeDao;

@Controller
public class GradeController {

	final static String VIEW_PATH = "/WEB-INF/views/";
	
	GradeDao grade_dao;

	public GradeDao getGrade_dao() {
		return grade_dao;
	}

	public void setGrade_dao(GradeDao grade_dao) {
		this.grade_dao = grade_dao;
	}
	
	
	
}
