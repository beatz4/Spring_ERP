<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="row" >
			<div class="col-lg-12">
				<h5 class="page-header"><i class="fa fa-archive fa-fw"></i> 기안문서 </h5>
				<h5><i></i></h5>
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
									<th width="80%" class="text-center">기안문서제목</th>
									<th width="20%" class="text-center">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }">
									<tr class="text-center">
										<td><a href="insert_form.do?doc_idx=${vo.doc_idx }">${vo.doc_title }</a></td>
										<td>${vo.regdate }</td>
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