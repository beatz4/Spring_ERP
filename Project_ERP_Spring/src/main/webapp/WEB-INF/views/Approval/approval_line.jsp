<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


</head>
<body>
	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp" />

	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="side_menu.jsp" />

	<div id="page-wrapper">
		<div class="container">
			<div class="col-lg-12" align="center">
				<h1 class="page-header">결재선 관리</h1>
			</div>

			<!-- 좌측 트리 -->
			<div class="col-lg-6" align="center">
				<div class="panel panel-default">
					<div class="panel-heading">부서</div>
					<div class="panel-body">

						<div data-addui='accordion'>
							<c:forEach var="com" items="${list }">
								<c:if test="${com.parent_idx eq '0' }">
									<div role='header'>${com.name }</div>

									<div role='content'>
										<c:forEach var="pany" items="${list }">
											<c:if
												test="${pany.parent_idx != '0' && pany.parent_idx == com.id }">
												<p name="company_user" class="${pany.idx }">${pany.name }</p>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<!-- 우측 -->

			<div class="col-lg-6" align="center">
				<div class="panel panel-default">
					<div class="panel-heading">결재선지정</div>
					<div class="panel-body" name="company_line_list"></div>
				</div>
			</div>


			<form role="form">
				<div class="row" style="height: 180px;">
					<div class="panel panel-default">
						<div class="panel-body" style="height: 100%;">
							<div class="col-lg-12" style="height: 100%;">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									height="100%" id="approval_line" type="button"
									data-target=".bs-example-modal-lg">
									<tr align="center" height="60px;">
										<th colspan="5"
											style="vertical-align: middle; text-align: center;">결재선</th>
									</tr>
									<tr height="70px;">
										<th width="10%"
											style="vertical-align: middle; text-align: center;">직위</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr height="70px;">
										<th style="vertical-align: middle; text-align: center;">성명</th>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>



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
	
	<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/addAccordion.js"></script>
	
	<script>
	
	
	$(document).ready(function(){
		
		
		$('[name=company_user]').on('click',function(){
			
			var idx =$(this).attr('class');
			$.ajax({
				url : "approval_line_list.do",
				data :{'idx' : idx},
				success :function(data){
					
					$('[name=company_line_list] div').remove();
					var user_data = eval(data);
					
					if(user_data.length!=0){
						var s = document.createElement("script");
						s.type = "text/javascript";
						s.src = "${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/addAccordion.js";
						$('[name=company_line_list]').append("<div data-addui='accordion' ><div role='header'>"+user_data[0].c_name+"</div><div name='user_name' role='content'></div></div>");
						for(var i = 0; i < user_data.length ; i++){
							
							var g_name = "<p name='company_user_list' class='g_level_"+user_data[i].g_level+"'>"+user_data[i].name+"("+user_data[i].g_position+")</p>"
							$('[name=user_name]').append(g_name);
						}
						$('[name=company_line_list]').append(s);
						
					}else{
						$('[name=company_line_list]').append("<div class='panel panel-default'><div class='panel-heading'><h5>조직원이 없습니다</h5></div></div>");
					}	
					
				}	
				
			});
			
		});
		
	});
	
	</script>


</body>
</html>