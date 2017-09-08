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

<!-- DataTables CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script>
	
	function del_user() {
		/* 사용자 삭제 - ajax (jquery) */

		/* 체크된 element 정보를 담을 변수 */
		var param = "";
		var count = 0;

		$("input:checkbox:checked").each(function() {
			// 해당 배열에 checkbox의 value(사번)을 넣어준다.
			if( param == "" )
				param = "index="+$(this).parent().children("#chk_user").val();
	        else 
	        	param = param + "&index="+$(this).parent().children("#chk_user").val();
			
			count++;
		});
		
		if( count == 0 ) {
			alert('선택된 사용자가 없습니다.');
			return;
		}
		
		// 삭제 확인
		if (confirm(count + '명을 정말 삭제 하시겠습니까?') == false) { 
			return;
		}

		// list를 ajax를 통해 delete.do servlet으로 전송
		var url = "delete.do";
		
		$.ajax({
			type : "POST",
			url : url,
			data : param,
			dataType : 'text',
			success : function(data) {
	
				document.location.href = "user_manager.do";
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	
</script>

</head>
<body>
	
	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp" />
	
	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="side_menu.jsp" />
	
	<div id="page-wrapper" style="height: 100%;">
		<div class="row" style="padding-top: 20px;">
			<div class="col-lg-12">
				<h1 class="page-header">결재선 목록</h1>
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
									<th width="10%">선택</th>
									<th style="text-align: center;">제목</th>
									<th width="10%">생성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ list }">
									<tr>
										<td id="chk_user" align="center">
											<input id="chk_user" type="checkbox" name="checkbox" value="${ vo.a_line_idx }">
										</td>
										<td style="text-align: center;"><a href="app_line_mod_form.do?a_line_idx=${vo.a_line_idx}">${ vo.a_line_name }</a></td>
										<td>${ vo.a_line_regdate }</td>
										
									</tr> 
								</c:forEach> 
							</tbody>
                        </table>
                         
                        <div class="well" >
                        	<!-- 사용자 추가 button -->
                        	<a class="btn btn-default btn-lg" href="insert_app_line.do">결재선 추가</a>
                        	<a class="btn btn-default btn-lg" target="_blank" 
                        		href="javascript:void(0);"
                        		onclick="del_app_line()">
                        			결재선 삭제
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
        $("td").css("text-align","center");
        $('#dataTables_wrapper .col-sm-6 #dataTables_filter').css("text-align","right");
        $('#dataTables_wrapper .col-sm-6 #dataTables_paginate').css("text-align","right");
        
    });
</script>

</body>
</html>