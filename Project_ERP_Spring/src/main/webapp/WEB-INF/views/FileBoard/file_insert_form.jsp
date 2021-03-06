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
	<script src="${pageContext.request.contextPath}/resources/ExternalLib/full_ckeditor/ckeditor.js"></script>
	
	<script type="text/javascript">
		function send(f){
			
			var recv_id = f.recv_id.value;
			var title = f.title.value;
			var content = CKEDITOR.instances.content.getData();
			
			if(recv_id==''){
				sweetAlert("알림!!", "보낼아이디를 입력하세요!!", "error");
				f.recv_id.focus();
				return;
			}
			
			if(title==''){
				sweetAlert("알림!!", "제목을 입력하세요!!", "error");
				f.title.focus();
				return;
			}
			
			if(content==''){
				sweetAlert("알림!!", "내용을 입력하세요!!", "error");
				f.title.focus();
				return;
			}
			
			swal({
				  title: "쪽지를 보내시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "보내기",
				  cancelButtonText: "취소",
				  closeOnConfirm: false,
				  allowEscapeKey: true
				},
				
				function(isConfirm){
					if(isConfirm){
						$.ajax( {
							url: 'insert.do', 				//요청(서버)페이지
							data:{'recv_id': recv_id,
								  'title': title, 
								  'content': content },	  	//파라미터
							success:function(data){	
								//서버에서 전달된 데이터
									if( $.trim(data) == 'ok' ) {
										f.action = "list.do";
										f.method = "post";
										f.submit();	
									}
							},
							error:function(request,status,error){
								swal("존재하지않는 아이디입니다", "보낼 아이디를 확인하세요!",  "error");
							}
						} );		
					}else{
						return;
					}
								
				});
			
			
		}
		
		/* 주소록 팝업 */
		function popupOpen(){
			var popUrl = "popup_list.do?input=";
			var popOption = "top=150, left=650, width=700, height=660, resizable=no, scrollbars=no, status=no;";
			
			window.name = "parentForm";
			window.open(popUrl,"childForm",popOption);
		}
		
	</script>

</head>
<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp"/>
	
	<!-- 본문 내용 -->
	<div id="page-wrapper" style="margin: 0;">
		<div class="container-fluid">
			<!-- page내용 -->
			<div style="padding-top: 40px;">
			  <div class="panel panel-default" style="margin:0; width: 58%;">
			    <div class="panel-heading">글쓰기</div>
			    <div class="panel-body">
			    	<form name="f">
						<div style="width: 100%;">
					      <label for="usr" style="margin-top: 20px;">제목</label>
					      <input style="width: 100%;" type="text" class="form-control" id="usr" name="title">
						</div>
						<div style="width: 100%;">	
					      <label for="comment" style="margin-top: 30px;">내용</label>
					      
					      <!-- CKEditor + 이미지 업로드기능 설정하기 -->
							<textarea name="content"></textarea>
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
	</div>
</body>
</html>