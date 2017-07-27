package com.ic.erp;

import org.springframework.stereotype.Controller;

import dao.CompanyDao;

@Controller
public class CompanyController {

	final static String VIEW_PATH = "/WEB-INF/views/";
	
	CompanyDao company_dao;

	public CompanyDao getCompany_dao() {
		return company_dao;
	}

	public void setCompany_dao(CompanyDao company_dao) {
		this.company_dao = company_dao;
	}
	
	
}
