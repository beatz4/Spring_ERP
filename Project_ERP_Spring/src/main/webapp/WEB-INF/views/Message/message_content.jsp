<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/message_send_form.css">

	<!-- sweetalert라이브러리 -->
	<script src="${ pageContext.request.contextPath }/resources/js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/sweetalert.css">

	<script type="text/javascript">
	
		function content_del(){
			var idx = ${ param.idx };
			var select = document.getElementById("select").value;
			
			swal({
				  title: "쪽지를 삭제하시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "삭제하기",
				  cancelButtonText: "취소",
				  closeOnConfirm: false,
				  allowEscapeKey: true
				},
				
				function(){
					location.href='content_delete.do?idx='+idx+'&select='+select;
				});			
		}
		
		function reply(){
			var idx = ${ param.idx };
			var select = document.getElementById("select").value;
			
			location.href='reply.do?idx='+idx+'&select='+select;
		}
		
		function box(){
			var idx = ${ param.idx };
			var select = document.getElementById("select").value;
			
			swal({
				  title: "쪽지를 보관하시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "보관하기",
				  cancelButtonText: "취소",
				  closeOnConfirm: false,
				  allowEscapeKey: true
				},
				
				function(){
					location.href='content_box.do?idx='+idx+'&select='+select;
				});
			
		}

	</script>
	
</head>
<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp"/>
	
	<!-- 서브 메뉴 -->
	<jsp:include page="message_index.jsp" />
	
	<!-- 본문 내용 -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<!-- page내용 -->
			<div style="padding-top: 40px;">
			  <div class="panel panel-default" style="margin:0; width: 58%;">
			    <div class="panel-heading">받은쪽지</div>
			    <div class="panel-body">			    
			    	<form name="f" method="get" action="insert.do">
						<table  id="send_table" style="width: 100%;">
							<tr>
								<td style="width:100%;">
								   <div style="width: 49%; float: left;">
								      <label for="usr">받은ID</label>
								      <div class="panel panel-default">
								      	<div style="max-width: 100%; width: 100%; height: auto; font-size: 15px; text-align: left; padding-left: 10px; padding-right: 10px; overflow: hidden; padding-top: 3px;">${ vo.recv_id }</div>
								      </div>
							      </div>
							      <div style="width: 49%; float: right;">
								      <label for="usr">보낸ID</label>
								      <div class="panel panel-default">
								      	<div style="width: 100%; height: auto; font-size: 15px; text-align: left; padding-left: 10px; padding-right: 10px; overflow: hidden; padding-top: 3px;">${ vo.send_id }</div>
								      </div>
							      </div>
								</td>
							</tr>
							<tr>
								<td>
									<div style="width: 100%; float: left;">
								      <label for="usr">제목</label>
								      <div class="panel panel-default">
								      	<div style="width: 100%; height: auto; font-size: 15px; text-align: left; padding-left: 10px; padding-right: 10px; overflow: hidden; padding-top: 3px;">${ vo.title }</div>
								      </div>
								    </div>
								</td>
							</tr>
							<tr>
								<td>
									<div style="width: 49%; float: left;">
								      <label for="usr">받은날짜</label>
								      <div class="panel panel-default">
								      	<div style="width: 100%; height: auto; font-size: 15px; text-align: left; padding-left: 10px; padding-right: 10px; overflow: hidden; padding-top: 3px;">${ vo.recv_date }</div>
								      </div>
								    </div>
									<div style="width: 49%; float: right;">
								      <label for="usr">보낸날짜</label>
								      <div class="panel panel-default">
								      	<div style="width: 100%; height: auto; font-size: 15px; text-align: left; padding-left: 10px; padding-right: 10px; overflow: hidden; padding-top: 3px;">${ vo.send_date }</div>
								      </div>
								    </div>
								</td>
							</tr>
							<tr>
								<td>	
								    <div style="width: 100%;">
								      <label for="comment">내용</label>
								    	<div class="panel panel-default">
								    		<div class="panel-body" style="width: 100%; height: 450px; overflow-y: auto; font-size: 15px;">${ vo.content }</div>	
								    	</div>
								    	<div style="width: 100%; margin-top: 15px;" align="right" >
										  <input type="hidden" id="select" value="${ param.select }">
											  <button type="button" class="btn btn-default" onclick="content_del()">삭제</button>
											  <button type="button" class="btn btn-default" onclick="reply()">답장</button>	
										  <c:if test="${ param.select eq 'list' }">
											  <button type="button" class="btn btn-default" onclick="box()">보관</button>	
										  </c:if>
										</div>
								    </div>
								</td>
							</tr>
						</table>
					</form>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>