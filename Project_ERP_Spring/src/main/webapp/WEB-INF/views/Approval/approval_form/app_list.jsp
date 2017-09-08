<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
 <!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 <!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/addAccordion.css"/>

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

<script>		
	
</script>

</head>
<body>
	
	<!-- 메뉴 불러오기 -->
	<jsp:include page="../../main/main_index.jsp" />
	
	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="../side_menu.jsp" />
	
	<div id="page-wrapper" style="height: 100%;">
		<div class="row" style="padding-top: 20px;">
			<div class="col-lg-12">
				<c:choose>
					<c:when test="${param.d_condition eq 1 && param.result eq 'request'}">
						<h1 class="page-header">결재 요청 목록</h1>
					</c:when>
					<c:when test="${param.d_condition eq 1 && param.result eq 'wating'}">
						<h1 class="page-header">결재  대기 목록</h1>
					</c:when>
					<c:when test="${param.d_condition eq 3 }">
						<h1 class="page-header">결재 완료 목록</h1>
					</c:when>
					<c:when test="${param.d_condition eq 2 }">
						<h1 class="page-header">결재 반려 목록</h1>
					</c:when>
					<c:otherwise>
						<h1 class="page-header">내가 받은 결재</h1>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables">
							<thead>
								<tr>
									<th width="7%" style="text-align: center;">선택</th>
									<th width="13%" style="text-align: center;">문서종류</th>
									<th style="text-align: center;">제목</th>
									<th width="10%" style="text-align: center;">작성자</th>
									<th width="10%" style="text-align: center;">진행상태</th>
									<th width="10%" style="text-align: center;">신청날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }">
									<tr>
										<td id="chk_user" align="center">
											<input id="chk_user" type="checkbox" name="checkbox" value="${ vo.app_d_idx }">
										</td>
										<td style="text-align: center;">${ vo.doc_title }</td>
										<td style="text-align: center;"><a href="app_document_index.do?app_d_idx=${vo.app_d_idx }">${ vo.app_document_title }</a></td>
										<td style="text-align: center;">${ vo.name }</td>
										<c:choose>
											<c:when test="${vo.d_condition eq 1 }">
												<td style="text-align: center;">결재대기</td>
											</c:when>
											<c:when test="${vo.d_condition eq 2 }">
												<td style="text-align: center;">반려</td>
											</c:when>
											<c:when test="${vo.d_condition eq 3 }">
												<td style="text-align: center;">결재완료</td>
											</c:when>
										</c:choose>
										<td>${ vo.app_one_date }</td>
									</tr> 
								</c:forEach> 
							</tbody>
                        </table>
                         
					</div>
				</div>
			<!-- /.col-lg-12 -->
			</div>
		<!-- /.row -->
		</div>
	<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	
<!-- jQuery -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.dataTables.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/dataTables.bootstrap.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/sb-admin-2.js"></script>
	
<script type="text/javascript">
	$(document).ready(function() {
        $('#dataTables').DataTable({
           	responsive: true 
        });
        $('td').css("text-align","center");
        $('#dataTables_wrapper .col-sm-6 #dataTables_filter').css("text-align","right");
        $('#dataTables_wrapper .col-sm-6 #dataTables_paginate').css("text-align","right");
        
    });
</script>

</body>
</html>