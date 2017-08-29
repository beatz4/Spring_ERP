<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="row" style="padding-top: 20px;">
			<div class="col-lg-5">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 결재 진행</h5>
			</div>
			<!-- /.col-lg-12 -->
			<div class="col-lg-7">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 개인 문서함</h5>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="approval">
								<tr>
									<th width="30%" class="text-center">미결제 문서</th>
									<td class="text-center">1</td>
								</tr>
								<tr>
									<th class="text-center">결제완료 문서</th>
									<td align="center">1</td>
								</tr> 
								<tr>
									<th class="text-center">반려 문서</th>
									<td align="center">1</td>	
								</tr> 
                        </table>
					</div>
				</div>
			<!-- /.col-lg-6 -->
			</div>
			<div class="col-lg-7">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="person_approval">
								<tr>
									<th width="20%" class="text-center">상신 문서</th>
									<td class="text-center"></td>
									<th width="25%" class="text-center">결재 완료 문서</th>
									<td class="text-center"></td>
								</tr>
								<tr>
									<th class="text-center">임시보관</th>
									<td class="text-center"></td>
									<th class="text-center">반려 문서</th>
									<td class="text-center"></td>
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
									<th width="12%" class="text-center">품의번호</th>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="50%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }" begin="0" end="2">
									<tr class="text-center">
										<td>-기획팀-2017-06-20-001</td>
										<td>지출결의서</td>
										<td>2017-07-19 회식비 지출</td>
										<td>XXX</td>
										<td>2017-07-20</td>
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
			<div class="col-lg-12">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 내가 올린 결재 > 결재 완료 문서</h5>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
							<thead>
								<tr>
									<th width="12%" class="text-center">품의번호</th>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="50%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }" begin="0" end="2">
									<tr class="text-center">
										<td>-기획팀-2017-06-20-001</td>
										<td>지출결의서</td>
										<td>2017-07-19 회식비 지출</td>
										<td>XXX</td>
										<td>2017-07-20</td>
										<td>완료</td>
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
			<div class="col-lg-12">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 내가 올린 결재 > 반려 문서</h5>
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
									<th width="12%" class="text-center">품의번호</th>
									<th width="10%" class="text-center">문서 분류</th>
									<th width="50%" class="text-center">제목</th>
									<th width="10%" class="text-center">기안자</th>
									<th width="10%" class="text-center">기안일</th>
									<th width="8%" class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }" begin="0" end="2">
									<tr class="text-center">
										<td>-기획팀-2017-06-20-001</td>
										<td>지출결의서</td>
										<td>2017-07-19 회식비 지출</td>
										<td>XXX</td>
										<td>2017-07-20</td>
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

</body>
</html>