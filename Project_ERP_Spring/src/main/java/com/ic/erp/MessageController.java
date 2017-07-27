package com.ic.erp;

import org.springframework.stereotype.Controller;

import dao.MessageDao;

@Controller
public class MessageController {

	final static String VIEW_PATH = "/WEB-INF/views/";
	
	MessageDao message_dao;

	public MessageDao getMessage_dao() {
		return message_dao;
	}

	public void setMessage_dao(MessageDao message_dao) {
		this.message_dao = message_dao;
	}
	
	
}
