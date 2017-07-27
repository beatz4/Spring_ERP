<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

		// Ajax 통신으로 사용자 아이디/패스워드 확인 요청
		var url = "check_login.do"; // LoginCheckUserAction
		var param = "id=" + id + "&password=" + password;

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
			
			g_f.action = "main.do";
			g_f.method = "post";
			g_f.submit();
		}
	}
	
</script>

</head>
<body>

<form>
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
								<!-- 아이디 기억하기 (우선block처리)
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div> 
								-->
								<input type="button" onclick="login(this.form);" class="btn btn-lg btn-success btn-block" value="Login">
							</fieldset>
						</form>
					</div>
				</div>
			</div> 
		</div>
	</div>
</form>

	<!--  -->
<!--  -->
	<%-- <form>
		<table>
			<caption>::: 로그인 :::</caption>
			<tr>
				<th>아이디:</th>
				<td><input id="id"></td>
			</tr>
			
			<tr>
				<th>패스워드:</th>
				<td><input type="password" id="password" onkeypress="if(event.keyCode==13) {login(this.form);}"></td>
			</tr>
			
			<tr>  
				<td colspan="2">
					<input type="button" class="login" value="로그인" onclick="login(this.form)">
				</td>
			</tr>
		</table>
		 
		<div class="find">
			<a href="#">ID/Password 찾기</a>
		</div>
	</form> --%>

</body>
</html>