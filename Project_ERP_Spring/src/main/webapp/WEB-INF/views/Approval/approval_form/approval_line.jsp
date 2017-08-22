<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
					<div class="panel-heading">
						부서
					</div>
				<div class="panel-body">
				
					 <div class="navbar-default" role="navigation">
						<div class="navbar-collapse">
						
							<ul class="nav" id="side-menu">
								<c:forEach var="com" items="${list }">
								<c:if test="${com.parent_idx eq '0' }">
								<li>
			                        <a href="#" name="copanyname">${com.name }<span class="fa arrow"></span></a>
			                        <ul class="nav nav-second-level">
			                        	<c:forEach var="pany" items="${list }">
			                         	 <li>
			                         	 	<c:if test="${pany.parent_idx != '0' && pany.parent_idx == com.id }">
			                               		<a name="company_user" class="${pany.idx }">${pany.name }</a>
			                               	</c:if>
			                          	</li>
			                          	</c:forEach>
			                        </ul>         
			                    </li>
			                    </c:if>
			                    </c:forEach>
			                </ul>
			            </div>
			       	</div>
				</div>
               </div>
			</div>
			
			<!-- 우측 -->
			<div class="col-lg-6" align="center">
				<div class="panel panel-default">
					<div class="panel-heading">
						결재선지정
					</div>
					<div class="panel-body">
				
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
			
			var idx = $(this).class();
			alert(idx);
		});
		
	});

</script>


</body>
</html>