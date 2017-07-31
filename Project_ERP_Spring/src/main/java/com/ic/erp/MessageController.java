package com.ic.erp;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MessageDao;
import dao.UserDao;
import util.Common;
import util.Paging;
import vo.MessageVo;
import vo.UserVo;

@Controller
public class MessageController {

	final static String VIEW_PATH = "/WEB-INF/views/Message/";
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext application;
	
	MessageDao message_dao;
	UserDao user_dao;

	public UserDao getUser_dao() {
		return user_dao;
	}

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}

	public MessageDao getMessage_dao() {
		return message_dao;
	}

	public void setMessage_dao(MessageDao message_dao) {
		this.message_dao = message_dao;
	}
	
	@RequestMapping("/Message/list.do")
	public String list(String page, Model model){
		
		UserVo user = (UserVo)session.getAttribute("user");
		
		if( user == null)
			return null;
		
		String recv_id = user.getId();
		
		//list.do?page=1
		int nowPage = 1;
		int start=0, end=0;
		if(page!=null && !page.isEmpty()){
			nowPage = Integer.parseInt(page);
		}
		
		//가져올 범위 계산
		start = (nowPage - 1) * Common.Message.BLOCK_LIST + 1;
		end = start + Common.Message.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("recv_id", recv_id);
		
		int rowTotal = message_dao.message_RowTotal(map);
		
		//페이지 메뉴 만들기
		String pageHtml = Paging.getPaging("list.do", nowPage, rowTotal, Common.Message.BLOCK_LIST, Common.Message.BLOCK_PAGE);
				
		//쪽지정보 가져오기
		//List<MessageVo> list = MessageDao.getInstance().selectList(recv_id);
		
		//페이징처리된 쪽지정보 가져오기
		List<MessageVo> list = message_dao.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageHtml", pageHtml);
		
		return VIEW_PATH+"message_list.jsp";
	}
	
	@RequestMapping("/Message/box_list.do")
	public String box_list(String page, Model model){
		
		UserVo user = (UserVo)session.getAttribute("user");
		
		if( user == null)
			return null;
		
		String recv_id = user.getId();
		
		//list.do?page=1
		int nowPage = 1;
		int start=0, end=0;
		if(page!=null && !page.isEmpty()){
			nowPage = Integer.parseInt(page);
		}
		
		//가져올 범위 계산
		start = (nowPage - 1) * Common.Message.BLOCK_LIST + 1;
		end = start + Common.Message.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("recv_id", recv_id);
		
		int rowTotal = message_dao.message_box_RowTotal(map);
		
		//페이지 메뉴 만들기
		String pageHtml = Paging.getPaging("list.do", nowPage, rowTotal, Common.Message.BLOCK_LIST, Common.Message.BLOCK_PAGE);
		
		//쪽지정보 가져오기
		//List<MessageVo> list = MessageDao.getInstance().selectList_box(recv_id);
		
		//페이징처리된 리스트
		List<MessageVo> list = message_dao.selectList_box(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageHtml", pageHtml);
		
		return VIEW_PATH+"message_box_list.jsp";
	}
	
	@RequestMapping("/Message/send_list.do")
	public String send_list(String page, Model model){
		
		UserVo user = (UserVo)session.getAttribute("user");
		
		if( user == null)
			return null;
		
		//list.do?page=1
		int nowPage = 1;
		int start=0, end=0;
		if(page!=null && !page.isEmpty()){
			nowPage = Integer.parseInt(page);
		}
		
		String send_id = user.getId();
		
		//가져올 범위 계산
		start = (nowPage - 1) * Common.Message.BLOCK_LIST + 1;
		end = start + Common.Message.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("send_id", send_id);
		
		int rowTotal = message_dao.message_send_RowTotal(map);
		
		//페이지 메뉴 만들기
		String pageHtml = Paging.getPaging("send_list.do", nowPage, rowTotal, Common.Message.BLOCK_LIST, Common.Message.BLOCK_PAGE);
				
		//쪽지정보 가져오기
		//List<MessageVo> list = MessageDao.getInstance().selectList_send(send_id);
		
		//페이징처리된 리스트
		List<MessageVo> list = message_dao.selectList_send(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageHtml", pageHtml);
		
		return VIEW_PATH+"message_send_list.jsp";
	}
	
	@RequestMapping("/Message/insert_form.do")
	public String insert_form(){
		
		List<UserVo> list = user_dao.selectList();
		
		request.setAttribute("list", list);
		
		return VIEW_PATH+"message_send_form.jsp";
	}
	
	@RequestMapping("/Message/insert.do")
	@ResponseBody
	public String insert(){
		
		//파라메타 받기
		String recv_id = request.getParameter("recv_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		if(content!=null||content!="") {
			//content안에 있는 \r\n을 엔터를 -> <br>로 변환해줘야 함
			content = content.replaceAll("\r\n", "<br>");
			content = content.replaceAll("<", "&");
			content = content.replaceAll("/>", "&");
		}
		
		String content_array[] = null;
		
		System.out.println(content);
		
		if(content.indexOf('&')!=-1){
			content_array = content.split("&");
		}
		
		for(int i=0; i<content_array.length;i++){
			if(content_array[i].indexOf("img")!=-1){
				content_array[i] = "<"+content_array[i]+"/>";
			}
			System.out.println(content_array[i]);
		}
		
		String id_array[] = null;
		
		if(recv_id.indexOf(',')!=-1) {
			id_array = recv_id.split(",");
		}else if(recv_id.indexOf(';')!=-1) {
			id_array = recv_id.split(";");
		}
		
		String result = "ng";
		
		//현자사용자 정보 받기
		UserVo user = (UserVo)session.getAttribute("user");
		
		String send_id = user.getId();
		int msg_idx = user.getIdx();
		
		//보내는 시간 구하기
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd [hh:mm]");
		
		String send_date = date.format(cal.getTime());
		
		String recv_date = "미수신";
		String send_state = "미수신";
		String msg_box = "nobox";
		
		String ip = request.getRemoteAddr();
		
		if(id_array == null) {
			MessageVo vo = new MessageVo(msg_idx, send_id, recv_id, title, content, send_date, recv_date, send_state, msg_box, ip);
			
			int res = message_dao.message_insert(vo);
			int res_send = message_dao.message_send_insert(vo);
		
			if( res != 0){
				result = "ok";
			}
		}else {
			for(int i=0; i<id_array.length;i++) {
				
				MessageVo vo = new MessageVo(msg_idx, send_id, id_array[i], title, content, send_date, recv_date, send_state, msg_box, ip);
				
				int res = message_dao.message_insert(vo);
				int res_send = message_dao.message_send_insert(vo);
			
				if( res != 0){
					result = "ok";
				}
			}
		}
		
		return result;
	}
	
	@RequestMapping("Message/view.do")
	public String view(int idx, Model model){
		
		MessageVo vo = message_dao.selectOne(idx);
		
		if(vo.getSend_state().equals("미수신")){
			//보내는 시간 구하기
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd [hh:mm]");
			
			String recv_date = date.format(cal.getTime());
			String send_state = "수신";
			
			Map map = new HashMap();
			map.put("idx", idx);
			map.put("recv_date", recv_date);
			map.put("send_state", send_state);
			
			int res = message_dao.msg_update_state(map);
		}
		
		model.addAttribute("vo", vo);
		
		return VIEW_PATH+"message_content.jsp";
	}
	
	@RequestMapping("Message/send_view.do")
	public String send_view(Model model){
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MessageVo vo = message_dao.selectOne(idx);
		
		model.addAttribute("vo", vo);
		
		return VIEW_PATH+"message_content.jsp";
	}
	
	@RequestMapping("/Message/delete.do")
	public String delete(){
		
		String[] list_checked = request.getParameterValues("list_checked[]");
		
		for(String str : list_checked){
			
			int idx = Integer.parseInt(str);
			
			int res = message_dao.delete(idx);
		}
		return "";
	}
	
	@RequestMapping("/Message/send_delete.do")
	public String send_delete(){
		
		String[] list_checked = request.getParameterValues("list_checked[]");
		
		for(String str : list_checked){
			
			int idx = Integer.parseInt(str);
			
			int res = message_dao.Msg_send_delete(idx);
			
		}
		
		return "";
	}
	
	@RequestMapping("/Message/content_delete.do")
	public String content_delete(int idx, Model model){
		
		String select = request.getParameter("select");
		
		if(select.equals("send_list")){
			int res_send = message_dao.Msg_send_delete(idx);
		}else{
			int res = message_dao.delete(idx);
		}
		
		model.addAttribute("select");
		
		return "redirect:"+select+".do";
	}
	
	@RequestMapping("/Message/box_move.do")
	public String box_move(){
		
		String[] list_checked = request.getParameterValues("list_checked[]");
		
		for(String str : list_checked){
			
			int idx = Integer.parseInt(str);
			
			int res = message_dao.box_update(idx);
			
		}
		
		return "";
	}
	
	@RequestMapping("/Message/content_box.do")
	public String content_box(Model model){
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		String select = request.getParameter("select");
		
		int res = message_dao.box_update(idx);
		
		model.addAttribute("select");
		
		return "redirect:"+select+".do";
	}
	
	@RequestMapping("/Message/popup_list.do")
	public String popup_list(Model model, String page, String search, String search_text){
			
		//list.do?page=1
		int nowPage = 1;
		int start=0, end=0;
		if(page!=null && !page.isEmpty()){
			nowPage = Integer.parseInt(page);
		}
		
		//가져올 범위 계산
		start = (nowPage - 1) * Common.popup.BLOCK_LIST + 1;
		end = start + Common.popup.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		//검색내용이 있으면
		if(search!=null && !search.isEmpty()){
			if(search.equals("idx")){
				map.put("idx", search_text);
			}else if(search.equals("g_position")){
				map.put("g_position", search_text);
			}else if(search.equals("name")){
				map.put("name",search_text);
			}else if(search.equals("id")){
				map.put("id",search_text);
			}
		}
		
		//검색 후 페이지 이동시 파라메타 유지를 위한 String
		String search_str = String.format("search=%s&search_text=%s", search==null ? "" : search, search_text==null ? "" : search_text);
		
		//페이징할 페이지의 전체 갯수
		int rowTotal = user_dao.popup_RowTotal();
		
		//페이지 메뉴 만들기
		String pageHtml = Paging.getPaging_popup("popup_list.do", search_str, nowPage, rowTotal, Common.popup.BLOCK_LIST, Common.popup.BLOCK_PAGE);
		
		//페이징처리된 유저정보 가져오기
		List<UserVo> list = user_dao.selectList_popup(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageHtml", pageHtml);
		
		return VIEW_PATH+"message_popup.jsp";
	}
	
	@RequestMapping("/Message/reply.do")
	public String reply(Model model){
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MessageVo vo = message_dao.selectOne(idx);
		
		String send_id = vo.getSend_id();
		
		model.addAttribute("send_id", send_id);
		
		return "redirect:insert_form.do";
	}
}
