<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
 <!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 <!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- jQuery -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/sb-admin-2.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/CKEditor/ckeditor.js"></script>
<!-- <script src="http://cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script> -->
</head>
<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp" />

	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="side_menu.jsp" />

	<!-- 본문 내용 -->

	<div id="page-wrapper">
		<div class="container">
		<c:if test="${param.doc_idx == 1 }">
			<%@include file="approval_form/expense_index.jsp" %>
		</c:if>
		<c:if test="${param.doc_idx == 2 }">
			<%@include file="approval_form/expense_index.jsp" %>
		</c:if>
		<c:if test="${param.doc_idx == 3 }">
			<%@include file="approval_form/expense_index.jsp" %>
		</c:if>
		
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-12">
						
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->


<!-- DatePicker css, js -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/datepicker3.css">
<script src="${pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap-datepicker.js""></script>
<script src="${pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>

<!-- NumberFormet js-->
<script src="${pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.number.js"></script>

</body>
</html>