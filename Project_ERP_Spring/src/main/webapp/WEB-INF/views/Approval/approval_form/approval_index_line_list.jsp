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
	
		function index_line_insert(param){
			
			$.ajax({
				
				url: "index_line_insert.do",
				data: {"a_line_idx" : param},
				success:function(data){
					
					 $(opener.document).find(".g_position_1").text(data[0].g_position_one);
					 $(opener.document).find(".g_position_2").text(data[0].g_position_two);
					 $(opener.document).find(".g_position_3").text(data[0].g_position_three);
					 $(opener.document).find(".g_position_4").text(data[0].g_position_four);
					 
					 $(opener.document).find(".g_position_1").attr("name",data[0].a_line_idx);
					 
					 $(opener.document).find(".g_position_1").attr("data-toggle",data[0].idx_one);
					 $(opener.document).find(".g_position_2").attr("data-toggle",data[0].idx_two);
					 $(opener.document).find(".g_position_3").attr("data-toggle",data[0].idx_three);
					 $(opener.document).find(".g_position_4").attr("data-toggle",data[0].idx_four);
					 
					 $(opener.document).find(".name_g_position_1").text(data[0].user_name_one);
					 $(opener.document).find(".name_g_position_2").text(data[0].user_name_two);
					 $(opener.document).find(".name_g_position_3").text(data[0].user_name_three);
					 $(opener.document).find(".name_g_position_4").text(data[0].user_name_four);
					
					 self.close();
					 
				}
				
				
			});
			
			
		}
	
</script>

</head>
<body>
	
	<div id="testDiv" style="display: none;">
		<!-- 메뉴 불러오기 -->
		<jsp:include page="../../main/main_index.jsp" />
	
		<!-- 사이드 메뉴 불러오기 -->
		<jsp:include page="../side_menu.jsp" />
	</div>
	
	<div id="page-wrapper" style="margin: 0px">
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
									<th width="5%">선택</th>
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
										<td style="text-align: center;"><a href="#" onclick="index_line_insert(${vo.a_line_idx});">${ vo.a_line_name }</a></td>
										<td>${ vo.a_line_regdate }</td>
										
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
        
        $('#dataTables_wrapper .col-sm-6 #dataTables_filter').css("text-align","right");
        $('#dataTables_wrapper .col-sm-6 #dataTables_paginate').css("text-align","right");
        
    });
	
</script>

</body>
</html>