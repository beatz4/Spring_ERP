<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/message_send_form.css">
	
	<!-- sweetalert라이브러리 -->
	<script src="${ pageContext.request.contextPath }/resources/js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/sweetalert.css">
	
	<!-- 선언 및 값 체크하기 -->
	<script src="${pageContext.request.contextPath}/resources/ExternalLib/msg_ckeditor/ckeditor.js"></script>
	
</head>
<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp"/>
	
	<!-- 서브 메뉴 -->
	<jsp:include page="file_board_index.jsp" />
	
	<!-- 본문 내용 -->
	<div id="page-wrapper">
		<!-- page내용 -->
		<div class="container"  style="width: 50%;">
		  <div class="panel panel-default"  style="margin:0">
		    <div class="panel-heading">글쓰기</div>
		    <div class="panel-body">
		    	<form name="f">	
					<table style="width: 100%;">
						<tr>
							<td width="90%">	
						      <label style="margin-top: 20px;">받는사람</label>
						      <input style="width: 99%;" type="text" class="form-control" id="pInput" name="recv_id" value="${ param.send_id ? '' : param.send_id }">		
							</td>
							<td width="10%" align="right">
							  <button style="width: 100%;margin-top: 45px;" type="button" class="btn" onclick="popupOpen()">주소록</button>
							</td>
						</tr>
					</table>
				
					<div style="width: 100%;">
				      <label style="padding-top: 20px;">제목</label>
				      <input style="width: 100%;" type="text" class="form-control" id="usr" name="title">
					</div>
			
					<div style="width: 100%;">									     
				      
				      <label style="margin-top: 30px;">내용</label>
				      
				      <!-- CKEditor + 이미지 업로드기능 설정하기 -->
						<textarea name="content" rows="15" cols="80"></textarea>
							<script>
								// Replace the <textarea id="editor1"> with a CKEditor
								// instance, using default configuration.
								CKEDITOR.replace( 'content', {
								filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload.do'
								});
									
								CKEDITOR.on('dialogDefinition', function( ev ){
							            var dialogName = ev.data.name;
							            var dialogDefinition = ev.data.definition;
							          
							            switch (dialogName) {
							                case 'image': //Image Properties dialog
									              //dialogDefinition.removeContents('info');
									              dialogDefinition.removeContents('Link');
									              dialogDefinition.removeContents('advanced');
									              break;
								    }
								 });
							</script>
							
						<div style="width: 100%; margin-top: 15px;" align="right">
						  <button style="width: 80px;" type="button" class="btn" onclick="send(this.form)">보내기</button>
						  <button style="width: 80px;" type="reset" class="btn">리셋</button>	
						</div>
					</div>
				</form>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>