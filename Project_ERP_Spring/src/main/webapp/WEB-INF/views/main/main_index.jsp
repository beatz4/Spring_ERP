<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
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

<script type="text/javascript">
	function logout() {

		if (confirm('정말 로그아웃 하시겠습니까?') == true) {
			location.href = '${ pageContext.request.contextPath }/main/login.do';
		}
	}
</script>

</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				<a class="navbar-brand" 
					href="${ pageContext.request.contextPath }/main/main.do">
					Project ERP
				</a>
			</div>
			<!-- /.navbar-header -->
			<!-- todo: index.html 링크 알맞게 변경 -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<li>
				<a 
					href="${ pageContext.request.contextPath }/BusinessContact/business_contact.do">
					업무 연락
				</a>
				</li>
				<li> 
				<a 
					href="${ pageContext.request.contextPath }/Approval/approval_main_page.jsp">
					전자 결재
				</a>
				</li>
				<li> 
				<a
					href="${ pageContext.request.contextPath }/FileBoard/file_board.do">
					자료실
				</a>
				</li> 
				<li>
				<a
					href="${ pageContext.request.contextPath }/Message/list.do?select=list">
					쪽지함
				</a>
				</li>
				<c:if test="${ user.id == 'admin' }">
					<li>
					<a
						href="${ pageContext.request.contextPath }/SystemAdmin/user_manager.do">
						시스템 관리
					</a>
					</li>
				</c:if>
				</ul>
				
				<ul class="nav navbar-top-links navbar-right">
              
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <!-- 로그아웃 -->
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)" onclick="logout()"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
                </ul>
            <!-- /.navbar-top-links -->
			</div>
			<!-- /.navbar-collapse -->
			
			<!-- 
			user dropdown menu
			todo : 각 링크 연결
			  -->
		</nav>
	</div>
	
<!-- jQuery -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/sb-admin-2.js"></script>

</body>
</html>