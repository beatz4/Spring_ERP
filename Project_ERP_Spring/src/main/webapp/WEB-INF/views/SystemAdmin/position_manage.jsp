<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직책 관리</title>

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

/* 체크박스 한개만 되도록 */
$(function() { 
		$('input[type="checkbox"]').bind('click',function() { 
		$('input[type="checkbox"]').not(this).prop("checked", false); 
	});
});

var param = "";
function modify() {
	
	// 모두 동일한 id를 사용하기때문에 each문을 돌려줘야 한다.
	$("input:checkbox:checked").each(function() {
		param =$(this).parent().children("#chk_position").val();
	});
	
	document.location.href = "position_modify_form.do?idx=" + param;
}

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
				<h1 class="page-header">직책 목록</h1>
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
									<th>선택</th>
									<th>번호</th>
									<th>직책명</th>
									<th>보안 등급</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }">
									<tr>
										<td id="chk_user">
											<input id="chk_position" type="checkbox" name="checkbox" value="${ vo.g_idx }">
										</td> 
										<td>${ vo.g_idx }</td>
										<td>${ vo.g_position }</td>
										<td>${ vo.g_level }</td>
									</tr> 
								</c:forEach> 
							</tbody>
                        </table>
                         
                        <div class="well"> 
                        	<!-- 직책 추가 button -->
                        	<a class="btn btn-default btn-lg" href="position_insert_form.do">직책 추가</a>
                        	<a class="btn btn-default btn-lg" target="_blank"
                        		href="javascript:void(0);" 
                        		onclick="modify()">
                        		직책 수정
                       		</a>
                        	<a class="btn btn-default btn-lg" target="_blank" 
                        		href="javascript:void(0);"
                        		onclick="del_position()">
                        			선택 직책 삭제
                      		</a>
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
    });
</script>

</body>
</html>