<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직책 추가</title>

<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- jQuery-Ajax를 사용하기위한 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">
</script>

</head>
<body>

	<!-- 주 메뉴 -->
	<jsp:include page="../main/main_index.jsp" />

	<!-- 사용자 정보, 서브 메뉴 -->
	<jsp:include page="../main/side_menu.jsp" />

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">직책 정보</h1>
			</div> 
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-3">
			</div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">세부 정보 입력</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form role="form">
								<!-- 이름 -->
								<div class="form-group">
									<label>직책명</label> 
									<input id="g_position" class="form-control">
									<p class="help-block">직책명을 입력하세요.</p>
								</div>

								<!-- 보안 레벨 번호 -->
								<div class="form-group">
									<label>보안 레벨</label>
									<select id="g_level" class="form-control">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
									</select>
								</div>

								<button type="button" class="btn btn-default"
										onclick="resgister(this.form);">추가</button>
								<button type="reset" class="btn btn-default" 
										onclick="location.href='position_manager.do'">취소</button>
								
							</form>
						</div>
						<!-- /.row (nested) -->
					</div>
					 <!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

<script type="text/javascript">

function resgister(f) {
	var g_position = $("#g_position").val().trim();
	var g_level = $("#g_level").val().trim();
	
	if( g_position == '' ) {
		alert('직책명이 공백입니다.');
		return;
	}
	
	var url = 'position_insert.do';

	//jQuery를 이용한 Ajax통신
	$.ajax({
		type : "POST",
		url : url, //요청(서버)페이지
		data : {
			'g_level' : g_level
			'g_position' : g_position,
		},
		success : function(data) {
			//서버에서 전달된 데이터
			if (data == 'fail') {
				alert('회원가입 실패!!\r\n관리자에게 문의하세요.');
			} else {
				alert('직책이 추가되었습니다.');

				f.action = "position_manager.do";
				f.method = "post";
				f.submit();

			}
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

</script>

</body>
</html>