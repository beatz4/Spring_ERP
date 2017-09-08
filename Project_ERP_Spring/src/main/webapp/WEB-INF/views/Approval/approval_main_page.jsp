<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
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

<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp" />

	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="side_menu.jsp" />

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 개인 문서함</h5>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="person_approval">
								<tr>
									<th width="20%" class="text-center">상신 문서</th>
									<c:choose>
										<c:when test="${count_1 eq null}">
											<td class="text-center">0</td>
										</c:when>
										<c:otherwise>
											<td class="text-center">${count_1}</td>
										</c:otherwise>
									</c:choose>
									<th width="25%" class="text-center">결재 완료 문서</th>
									<c:choose>
										<c:when test="${count_3 eq null}">
											<td class="text-center">0</td>
										</c:when>
										<c:otherwise>
											<td class="text-center">${count_3}</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<th class="text-center">대기 문서</th>
									<c:choose>
										<c:when test="${count_1_1 eq null}">
											<td class="text-center">0</td>
										</c:when>
										<c:otherwise>
											<td class="text-center">${count_1_1}</td>
										</c:otherwise>
									</c:choose>
									<th class="text-center">반려 문서</th>
									<c:choose>
										<c:when test="${count_2 eq null}">
											<td class="text-center">0</td>
										</c:when>
										<c:otherwise>
											<td class="text-center">${count_2}</td>
										</c:otherwise>
									</c:choose>
								</tr>
                        </table>
					</div>
				</div>
			<!-- /.col-lg-6 -->
			</div>
		</div>
		<div class="row">	
			<div class="col-lg-12">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 내가 올린 결재 > 미결재 문서</h5>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
							<thead class="text-center">
								<tr>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="62%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${list_1 eq null }">
									<tr class="text-center">
										<td colspan="5">문서함이 비어있습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="vo" items="${ list_1 }" begin="0" end="2">
									<tr class="text-center">
										<td>${vo.doc_title }</td>
										<td>${vo.app_document_title }</td>
										<td>${vo.name }</td>
										<td>${vo.app_one_date}</td>
										<td>상신</td>
									</tr> 
								</c:forEach> 
							</tbody>
                        </table>
					</div>
				</div>
			<!-- /.col-lg-12 -->
			</div>
		</div>
	
		<div class="row">
			<div class="col-lg-6">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 내가 올린 결재 > 결재 완료 문서</h5>
			</div>
			<!-- /.col-lg-12 -->
			<div class="col-lg-6">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 내가 올린 결재 > 반려 문서</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
							<thead>
								<tr>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="20%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${list_3 eq null }">
									<tr class="text-center">
										<td colspan="5">문서함이 비어있습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="vo" items="${ list_3 }" begin="0" end="2">
									<tr class="text-center">
										<td>${vo.doc_title }</td>
										<td>${vo.app_document_title }</td>
										<td>${vo.name }</td>
										<td>${vo.app_one_date}</td>
										<td>완료</td>
									</tr> 
								</c:forEach>
							</tbody>
                        </table>
					</div>
				</div>
			<!-- /.col-lg-12 -->
			</div>
		
			
			<!-- /.col-lg-12 -->
		
		
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables">
							<thead>
								<tr>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="20%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${list_2 eq null }">
									<tr class="text-center">
										<td colspan="5">문서함이 비어있습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="vo" items="${ list_2 }" begin="0" end="2">
									<tr class="text-center">
										<td>${vo.doc_title }</td>
										<td>${vo.app_document_title }</td>
										<td>${vo.name }</td>
										<td>${vo.app_one_date}</td>
										<td>반려</td>
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
	
		<div class="row">
			<div class="col-lg-12">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 내가 받은 결재 </h5>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables">
							<thead>
								<tr>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="62%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${list eq null }">
									<tr class="text-center">
										<td colspan="5">문서함이 비어있습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="vo" items="${ list }" begin="0" end="2">
									<tr class="text-center">
										<td>${vo.doc_title }</td>
										<td>${vo.app_document_title }</td>
										<td>${vo.name }</td>
										<td>${vo.app_one_date}</td>
										<c:choose>
											<c:when test="${vo.d_condition eq 1 }">
												<td>상신</td>
											</c:when>
											<c:when test="${vo.d_condition eq 2 }">
												<td>반려</td>
											</c:when>
											<c:when test="${vo.d_condition eq 3 }">
												<td>완료</td>
											</c:when>
										</c:choose>
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
		
	</div>
	<!-- /#page-wrapper -->
	<!-- jQuery -->
<script type="text/javascript">
	$(document).ready(function(){
		
		$("td").css("white-space","nowrap");
		$("td").css("overflow","hidden");
		$("td").css("text-overflow","ellipsis");
		
	});
</script>
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

</body>
</html>