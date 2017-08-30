<!-- Side Menu bootstrap 적용 ver -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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

<!-- 
과연 같은 양식에 링크만 다른 이 구조를 각자 들고 있는 것이 나을 것인가 아니면
각각 해당 데이터만을 set해서 넘겨주는 구조가 더 나을까...
 -->

<!--
	data mapping 방식
	아이콘 참고 : http://fontawesome.io/icons/
	해당 아이콘 class 뒤에 fa-fw를 붙혀주어야 한다. 
	이 테마 네이밍이 이렇게 되어 있는듯. 
	정확한 속성은 아직 모름. (있을 때나 없을때나 모양은 같으나 이벤트같은 것이 물려있을수도)
-->

<!--
	중복 코드 방지를 위해 하나의 jsp만을 사용하도록 리팩토링이 가능하다면 수정
	
	system admin
	사용 아이콘 클래스
	사용자 관리 - fa-user-plus
	조직 구성 - fa-users
	직책 관리 : fa-address-card-o
	게시판 관리 : fa-bars
	
	<c:forEach var="m" items="${ menu }">
		${ m }<br>
	</c:forEach>
-->
	
	<nav class="navbar navbar-inverse sidebar" role="navigation" style="margin:0;">
	    <div class="container-fluid">
    		<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${ pageContext.request.contextPath }/Message/list.do?select=list"">쪽지함</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1" align="center">
				<ul class="nav navbar-nav">
					<li>
						<a href="${ pageContext.request.contextPath }/Message/insert_form.do?select=insert_form">쪽지쓰기
						<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-send"></span></a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Message/list.do?select=list">받은쪽지함
						<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-collapse-down"></span></a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Message/send_list.do?select=send_list">보낸쪽지함
						<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-collapse-up"></span></a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Message/box_list.do?select=box_list">쪽지보관함
						<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-inbox"></span></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	
	<%-- <div id="wrapper">
		<!-- Navigation -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					
					<li>
						<a href="${ pageContext.request.contextPath }/Message/insert_form.do?select=insert_form">
							<i class="fa fa-paper-plane fa-fw"></i> 쪽지쓰기
						</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Message/list.do?select=list">
							<i class="fa fa-archive fa-fw"></i> 받은쪽지함
						</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Message/send_list.do?select=send_list">
							<i class="fa fa-archive fa-fw"></i> 보낸쪽지함
						</a>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Message/box_list.do?select=box_list">
							<i class="fa fa-archive fa-fw"></i> 쪽지보관함
						</a>
					</li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
		<!-- Page Content -->
		<!-- 좌측 wrapper 태그가 들어오면 세로 나눔선이 생긴다. -->
		
	</div>
	<!-- Wrapper --> --%>
</body>
</html>