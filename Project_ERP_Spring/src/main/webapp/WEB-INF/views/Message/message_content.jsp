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
	<div id="page-wrapper" style="height: 900px; margin: 0; margin-left: 200px;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					
					<!-- page내용 -->
					
					<div class="container"  style="width: 950px;">
					  <div class="panel panel-default"  style="margin:0">
					    <div class="panel-heading">받은쪽지</div>
					    <div class="panel-body">
					    
					    	<form name="f" method="get" action="insert.do">
								<table  id="send_table">
									<tbody style="width: 65%;">
										<tr>
											<td>
												<div style="width: 850px;">
											      <label for="usr">보낸사람</label>
											      <div class="panel panel-default">
											      	<div style="width: 100%; height: 35px; font-size: 20px; text-align: left; margin-left: 10px; overflow: auto; padding-top: 3px;">${ vo.send_id }</div>
											      </div>
											    </div>
											</td>
										</tr>
										<tr>
											<td>
												<div style="width: 850px;">
											      <label for="usr">제목</label>
											      <div class="panel panel-default">
											      	<div style="width: 100%; height: 35px; font-size: 20px; text-align: left; margin-left: 10px; overflow: auto; padding-top: 3px;">${ vo.title }</div>
											      </div>
											    </div>
											</td>
										</tr>
										<tr>
											<td>
												<div style="width: 850px; margin-top: 10px;">
											      <label for="usr">보낸날짜</label>
											      <div class="panel panel-default">
											      	<div style="width: 100%; height: 35px; font-size: 20px; text-align: left; margin-left: 10px; overflow: auto; padding-top: 3px;">${ vo.send_date }</div>
											      </div>
											    </div>
											</td>
										</tr>
										<tr>
											<td>	
											    <div style="width: 850px; margin-top: 10px;">
											      <label for="comment">내용</label>
											    	<div class="panel panel-default">
											    		<div class="panel-body" style="width: 100%; height: 380px; overflow: auto; font-size: 20px;">${ vo.content }</div>	
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
									</tbody>
								</table>
							</form>
					    
					    </div>
					  </div>
					</div>
					
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	
</body>
</html>