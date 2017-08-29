<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Cookie[] cookie = request.getCookies();
	String id = "";
	if(cookie != null){
		for(int i=0; i<cookie.length; i++){
			if(cookie[i].getName().trim().equals("id")){
				//System.out.println(cookie[i].getValue());
				id = cookie[i].getValue();
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project ERP Login</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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

<!-- login CSS -->	
<link href="${ pageContext.request.contextPath }/resources/css/login_action.css" rel="stylesheet" type="text/css">

<!-- login particles.js -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/particles.js"></script>

<!-- jQuery -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/sb-admin-2.js"></script>

<!-- Ajax를 이용하기 위한 라이브러리 설정  -->
<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>

<script type="text/javascript">

	var g_f;
	
	function login(f) {
		
		g_f = f;
		
		var id = $("#id").val();
		var password = $("#password").val();
		var saveId = $("#saveId").prop("checked");
		 
		if (id == '') {
			alert('아이디를 입력하세요!!');
			$("#id").focus();
			return;
		}

		if (password == '') {
			alert('패스워드를 입력하세요!!');
			$("#password").focus();
			return;
		}

		// 첫 시작 페이지로 login 페이지를 설정하였으므로 url을 바꾸어준다.
		var url = "${ pageContext.request.contextPath }/main/check_login.do";
		var param = "id=" + id + "&password=" + password +"&saveId=" + saveId;

		sendRequest(url, param, resultFn_login, "GET");
	}

	function resultFn_login() {
		
		if (xhr.readyState == 4 && xhr.status == 200) {

			var data = xhr.responseText;

			if (data.indexOf('id_ng') >= 0) {
				alert('아이디가 존재하지 않습니다.');
				$("#id").focus();
				return;
			}
			
			if (data.indexOf('pw_ng') >= 0) {
				alert('패스워드가 틀렸습니다.');
				$("#password").focus();
				return;
			}
			
			alert('로그인 성공!!');
			
			g_f.action = "${ pageContext.request.contextPath }/main/main.do";
			g_f.method = "post";
			g_f.submit();
		}
	}
	
</script>

</head>
<body>
<form>
	<div class="container">
		<div id="login-box">
			<div class="logo">
				<h1 class="logo-caption"><span class="tweak">P</span>roject<span class="tweak"> ERP</span></h1> 
				<img class="img img-responsive img-circle center-block"/>
				<h1 class="logo-caption"><span class="tweak">L</span>ogin</h1>
			</div>
			<div class="controls">
				<input class="form-control" placeholder="id" name="id" id="id" value="<%=id %>" autofocus />
				<input class="form-control" placeholder="Password" id="password"
										name="password" type="password" onkeypress="if(event.keyCode==13) {login(this.form);}" />
				<div class="checkbox" style="color: white;">
	    	    	<label>
	    	    		<input id="saveId" name="saveId" type="checkbox" <% if(id.length()>1) out.println("checked"); %>> Remember Me
	    	    	</label>
			    </div>
				<button type="button" class="btn btn-default btn-block btn-custom" onclick="login(this.form);">Login</button>
			</div>
		</div>
	</div>
	<div id="particles-js"></div>
</form>

<!-- <form>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="id" name="id" id="id" 
											autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password" id="password"
										name="password" type="password" onkeypress="if(event.keyCode==13) {login(this.form);}" >
								</div>
								<input type="button" onclick="login(this.form);" class="btn btn-lg btn-success btn-block" value="Login">
							</fieldset>
						</form>
					</div>
				</div>
			</div> 
		</div>
	</div>
</form> -->

</body>
</html>