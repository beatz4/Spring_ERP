<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<!-- Bootstrap Core CSS -->
<link
	href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- jQuery-Ajax를 사용하기위한 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>

	<div class="col-lg-12" align="center">
		<h1 class="page-header">결재선 관리</h1>
	</div>

	<!-- 좌측 트리 -->
	<div class="col-lg-6" align="center">
		<div class="panel panel-default">
			<div class="panel-heading">부서</div>
			<div class="panel-body">
				<c:forEach var="com" items="${list }">
					<c:if test="${com.parent_idx eq '0' }">
						<div class="panel panel-default">
							
							<div class="panel-heading">
								<h5>
									<a data-toggle="collapse" data-parent="#accordion"
										href="[name=${com.idx }]">${com.name }</a>
								</h5>
							</div>
							
							<c:forEach var="pany" items="${list }">
								<c:if test="${pany.parent_idx != '0' && pany.parent_idx == com.id }">
									<div name="${pany.parent_idx}" class="panel-collapse collapse">
										<div class="panel-body">
											<a name="company_user" class="${pany.idx }">${pany.name }</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>

	<!-- 우측 -->
	<div class="col-lg-6" align="center">
		<div class="panel panel-default">
			<div class="panel-heading">결재선지정</div>
			<div class="panel-body" name="company_line_list">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h5>
							<a data-toggle="collapse" data-parent="#accordion" href="[name=]"></a>
						</h5>
					</div>
					<div name="" class="panel-collapse collapse">
						<div class="panel-body">
							<a name="company_user_list" class=""></a>
						</div>
					</div>
				</div>


				<!-- <div class="navbar-default" role="navigation">
					<div class="navbar-collapse">

						<ul class="nav" name="company_line_list">
							<a href="#"><span class="fa arrow"></span></a>
						</ul>
					</div>
				</div> -->

			</div>
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
						$('[name=company_line_list]').append("<div class='panel panel-default'><div class='panel-heading'><h5><a data-toggle='collapse' data-parent='#accordion' href='[name="+user_data[0].c_idx+"]'>"+user_data[0].c_name+"</a></h5></div>");
						for(var i = 0; i < user_data.length ; i++){
							var g_name = "<div name='"+user_data[i].c_idx+"' class='panel-collapse collapse in'><div class='panel-body'><a name='company_user_list' class='"+user_data[i].g_level+"'>"+user_data[i].name+"("+user_data[i].g_position+")</a></div></div></div>"
							$('[name=company_line_list]').append(g_name);
						}
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