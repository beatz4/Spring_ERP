<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- jQuery -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/metisMenu.min.js"></script>

</head>
<body>

	<div id="wrapper">
		<!-- Navigation -->
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">

					<li><a
						href="${ pageContext.request.contextPath }/SystemAdmin/user_manager.do">
							<i class="fa fa-user-plus fa-fw"></i> 사용자 관리
					</a></li>
					<li><a
						href="${ pageContext.request.contextPath }/SystemAdmin/company_organize.do">
							<i class="fa fa-users fa-fw"></i> 조직 구성
					</a></li>
					<li><a
						href="${ pageContext.request.contextPath }/SystemAdmin/position_manager.do">
							<i class="fa fa-sitemap fa-fw"></i> 직책 관리
					</a></li>
					<li><a
						href="${ pageContext.request.contextPath }/SystemAdmin/board_manager.do">
							<i class="fa fa-bars fa-fw"></i> 게시판 관리
					</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
		<!-- Page Content -->
		<!-- 좌측 wrapper 태그가 들어오면 세로 나눔선이 생긴다. -->

	</div>
	<!-- Wrapper -->

</body>
</html>