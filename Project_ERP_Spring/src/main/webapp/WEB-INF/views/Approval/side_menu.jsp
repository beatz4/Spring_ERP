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

<!-- dropFunction -->
<script
	src="${ pageContext.request.contextPath }/resources/js/dropFunction.js"></script>
	
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


<script type="text/javascript">
	function logout() {

		if (confirm('정말 로그아웃 하시겠습니까?') == true) {
			location.href = '${ pageContext.request.contextPath }/main/login.do';
		}
	}
</script>

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
				<a class="navbar-brand" href="#">전자결제</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1" align="center">
				<ul class="nav navbar-nav">
					<li>
						<a href="${ pageContext.request.contextPath }/Approval/doc_type.do">작성 하기
						<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">내가 받은 결제
						<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-save-file"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu" style="text-align: center;">
							<li style="border: 0;"><a href="#">결제 대기</a></li>
							<li style="border: 0;"><a href="#">미결제 문서</a></li>
							<li style="border: 0;"><a href="#">결제 완료 문서</a></li>
							<li style="border: 0;"><a href="#">반려 문서</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">내가 올린 결제
						<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-open-file"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu" style="border: 0; text-align: center;">
							<li style="border: 0;"><a href="#">결제 대기</a></li>
							<li style="border: 0;"><a href="#">미결제 문서</a></li>
							<li style="border: 0;"><a href="#">결제 완료 문서</a></li>
							<li style="border: 0;"><a href="#">반려 문서</a></li>
						</ul>
					</li>
	
					<li>
						<a href="${ pageContext.request.contextPath }/Approval/app_line.do">결제선 관리
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
						<a href="doc_type.do">
							<i class="fa fa-user-plus fa-fw"></i> 작성 하기
						</a>
					</li>
					<li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 내가 받은 결제<span class="fa arrow"></span></a>
                           <ul class="nav nav-second-level">
                              <li>
                                   <a href="#"> 결재 대기</a>
                              </li>
                              <li>
                                   <a href="#"> 미결재 문서</a>
                              </li>
                              <li>
                                   <a href="#"> 결재 완료 문서</a>
                              </li>
                              <li>
                                   <a href="#"> 반려 문서</a>
                              </li>
                         </ul>
                           <!-- /.nav-second-level -->
                    </li>
					<li>
						<a href="${ pageContext.request.contextPath }/SystemAdmin/position_manager.do">
							<i class="fa fa-sitemap fa-fw"></i> 내가 올린 결재 <span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                              <li>
                                   <a href="#"> 결재 대기</a>
                              </li>
                              <li>
                                   <a href="#"> 미결재 문서</a>
                              </li>
                              <li>
                                   <a href="#"> 결재 완료 문서</a>
                              </li>
                              <li>
                                   <a href="#"> 반려 문서</a>
                              </li>
                         	</ul>
					</li>
					<li>
						<a href="${ pageContext.request.contextPath }/Approval/insert_app_line.do">
							<i class="fa fa-sitemap fa-fw"></i> 결재선 관리
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