<!-- 사용자 추가 form -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신규 사원 가입</title>

<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- zTree -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/css/zTreeStyle.css" rel="stylesheet" type="text/css">

<!-- 정규식 -->
<script src="${ pageContext.request.contextPath }/resources/regular/regular.js"></script>	

<!-- jQuery-Ajax를 사용하기위한 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 다음 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>

	<!-- 주 메뉴 -->
	<jsp:include page="../main/main_index.jsp" />
	<!-- 사용자 정보, 서브 메뉴 -->
	<jsp:include page="system_index.jsp" />

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">신규 사원 정보</h1>
			</div> 
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-3">
			</div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">가입 양식</div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form role="form">
								<!-- 이름 -->
								<div class="form-group">
									<label>이름</label> 
									<input id="name" class="form-control">
									<p class="help-block">이름을 입력하세요.</p>
								</div>

								<!-- 주민 번호 -->
								<div class="form-group">
									<label>주민번호</label> 
									<input id="regnumber" class="form-control">
									<p class="help-block">-를 포함하여 입력해주세요.</p>
								</div>

								<!-- 아이디 -->
								<label>아이디</label>
								<div class="form-group"> 
									<div class="input-group">
										<input id="id" type="text" class="form-control">
										<span class="input-group-btn">
											<button class="btn btn-secondary" type="button" onclick="chk_Id_dup();">
												중복체크
											</button>
										</span>
									</div>
									<p class="help-block">특문을 제외한 아이디를 입력해주세요.</p>
								</div>
								
								<!-- 비밀 번호 -->
								<div class="form-group">
									<label>비밀번호</label> 
									<input id="pwd" type="password"
										class="form-control" onkeyup="confirm_PW();">
									<p class="help-block">특문, 숫자 포함 8글자 이상입력해주세요.</p>
								</div>
								
								<!-- 비밀 번호 확인 -->
								<div class="form-group">
									<label>비밀번호 확인</label> 
									<input id="c_pwd" type="password" class="form-control" onkeyup="confirm_PW();"> 
									<span id="msg"></span>
								</div>

								<!-- 주소 입력 -->
								<label>주소</label>
								<div class="form-group"> 
									<div class="input-group">
										<input id="address" type="text" class="form-control" placeholder="버튼을 이용해주세요." disabled="disabled">
										<span class="input-group-btn">
											<button class="btn btn-secondary" type="button" onclick="find_address();">
												검색 
											</button>
										</span>
									</div>
								</div>
								
								<!-- 이메일 -->
								<div class="form-group">
									<label>E-Mail</label> 
									<input id="email" class="form-control">
									<p class="help-block">@를 포함하여 정확히 기입해주세요.</p>
								</div>
								
								<!-- 전화번호 -->
								<div class="form-group">
									<label>전화 번호</label> 
									<input id="phone" class="form-control">
									<p class="help-block">-를 포함하여 입력해주세요.</p>
								</div>
								
								<!-- 직급 -->
								<div class="form-group">
									<label>직급</label>
									<c:forEach var="g" items="${ list }">
										<div class="radio">
											<label> 
												<!-- 처음 권한을 선택한 것을 기본값으로 한다. -->
												<c:choose>
													<c:when test="${ g.g_idx eq '1' }">
														<input type="radio" name="optionsRadios" id="position" value="${ g.g_idx }" checked="checked">${ g.g_position }
													</c:when>
													<c:otherwise>
														<input type="radio" name="optionsRadios" id="position" value="${ g.g_idx }">${ g.g_position }
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</c:forEach>
								</div>
								
								<!-- 소속 팀 트리구조 -->
								<div class="form-group">
									<label>소속 그룹</label>  
										<ul id="treeDemo" class="ztree"></ul>
								</div>
								
								<button type="button" class="btn btn-default"
										onclick="resgister(this.form);">가입</button>
								<button type="reset" class="btn btn-default" 
										onclick="location.href='${ pageContext.request.contextPath }/resources/SystemAdmin/user_manager.do'">취소</button>
								
							</form>
						</div>
						<!-- /.row (nested) -->
					</div>
					 <!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 -->
			<div class="col-lg-3">
			</div>
			<!-- /.col-lg-3 -->
		</div>
		<!-- /.row -->
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

<!-- Custom Theme JavaScript -->
<script
	src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/sb-admin-2.js"></script>
	
<!-- zTree JavaScript -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/js/jquery.ztree.core.js"></script>
	
<!-- zTree Script -->
<script type="text/javascript">
	 
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	
	/* json형식 데이터를 servlet에서 받아와야한다. */
	var zNodes =[
		{ id:1, pId:0, name:"pNode 1", open:true},
		{ id:11, pId:1, name:"pNode 11"},
		{ id:111, pId:11, name:"leaf node 111" },
		{ id:112, pId:11, name:"leaf node 112" },
		{ id:113, pId:11, name:"leaf node 113" },
		{ id:114, pId:11, name:"leaf node 114" },
		{ id:12, pId:1, name:"pNode 12" },
		{ id:121, pId:12, name:"leaf node 121" },
		{ id:122, pId:12, name:"leaf node 122"},
		{ id:123, pId:12, name:"leaf node 123"},
		{ id:124, pId:12, name:"leaf node 124"},
		{ id:13, pId:1, name:"pNode 13 - no child", isParent:true },
		{ id:2, pId:0, name:"pNode 2"},
		{ id:21, pId:2, name:"pNode 21", open:true},
		{ id:211, pId:21, name:"leaf node 211"},
		{ id:212, pId:21, name:"leaf node 212"},
		{ id:213, pId:21, name:"leaf node 213"},
		{ id:214, pId:21, name:"leaf node 214"},
		{ id:22, pId:2, name:"pNode 22"},
		{ id:221, pId:22, name:"leaf node 221"},
		{ id:222, pId:22, name:"leaf node 222"},
		{ id:223, pId:22, name:"leaf node 223"},
		{ id:224, pId:22, name:"leaf node 224"},
		{ id:23, pId:2, name:"pNode 23"},
		{ id:231, pId:23, name:"leaf node 231"},
		{ id:232, pId:23, name:"leaf node 232"},
		{ id:233, pId:23, name:"leaf node 233"},
		{ id:234, pId:23, name:"leaf node 234"},
		{ id:3, pId:0, name:"pNode 3 - no child", isParent:true}
	];
	
	
	// alert(out); 
	
	$(document).ready(function(){
		
		
		
		
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</script>
	
<!-- General Script -->
<script type="text/javascript">

var checkID = false;		// 아이디 중복체크 유/무

function chk_Id_dup() {
	
	var id = $("#id").val().trim();
	
	if( id == '' ) {
		alert('아이디를 입력해주세요');
		return;
	}
	
	if(reg_special_char.test(id)) {
		alert('아이디에 특수문자가 포함되어 있습니다.');
		$("#id").focus();
		return;
	}
	
	var url = 'check_id.do';
	
	//jQuery를 이용한 Ajax통신
	$.ajax( {
				url: url, 				//요청(서버)페이지
				data:{ 'id': id }, 		//파라미터
				success:function(data){	
					//서버에서 전달된 데이터
					if( data == 'ok' ) {
						alert('사용가능한 아이디입니다.');	
						checkID = true;
					} else {
						alert('이미 사용중인 아이디입니다!!');
						checkID = false;
					}
				},
				error:function(request,status,error){
					alert("code:" + request.status +
							"\n" + "message:" +
							request.responseText + 
							"\n" + "error:" + error);
				}
			});
}

function find_address() {
	
	windRef = new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            document.getElementById("address").value = data.address;
        }
	// 중복 팝업 제거를 위한 이름 부여
    }).open({popupName: 'postcodePopup'});	
}

function confirm_PW() {
	
	var msg = document.getElementById("msg");
	var pw = document.getElementById("pwd").value;
	var c_pw = document.getElementById("c_pwd").value;
	
	if( !reg_password.test(pw) ) {
		msg.style.color = 'red';
		msg.innerHTML = '8~16자리 영문(한글)+숫자+특문 포함해주세요.';
		return;
	}
	
	if( pw != '' && c_pw != '' ) {
		if( pw != c_pw ) {
			
			msg.style.color = 'red';
			msg.innerHTML = '비밀번호 불일치';
			return;
		} 
		
		msg.style.color = 'blue';
		msg.innerHTML='비밀번호 일치';
	} else {
		msg.innerHTML='';
	}
}

function change_id() {
	checkID = false;
}

function resgister(f) {
	
	// 모든 공백은 자동 제거한다.
	var name = $("#name").val().trim();
	var regnumber = $("#regnumber").val().trim();
	var id = $("#id").val().trim();
	var pwd = $("#pwd").val().trim();
	var c_pwd = $("#c_pwd").val().trim();
	var address = $("#address").val().trim();
	var email = $("#email").val().trim();
	var phone = $("#phone").val().trim();
	var position = $(':radio[name="optionsRadios"]:checked').val();
	
	if( name == '' ) {
		alert('올바른 이름을 입력하세요');
		$("#name").focus();
		return;
	}
	
	if( reg_name.test(name) == false ) {
		alert('이름을 한글/영문으로만 입력하세요');
		$("#name").focus();
		return;
	}
	
	if( regnumber == '' ) {
		alert('주민번호를 입력하세요');
		$("#regnumber").focus();
		return;
	}
	
	if( reg_regnumber.test(regnumber) == false ) {
		alert('올바른 주민번호를 입력하세요');
		$("#regnumber").focus();
		return;
	}
	
	if( id == '' ) {
		alert('아이디를 입력하세요');
		$("#id").focus();
		return;
	}
	
	if( checkID == false ) {
		alert('아이디 중복체크를 먼저 해주세요');
		return;
	}

	if(reg_special_char.test(id)) {
		alert('아이디에 특수문자가 포함되어 있습니다.');
		$("#id").focus();
		return;
	}
	
	if( pwd == '' ) {
		alert('패스워드를 입력하세요');
		$("#pwd").focus();
		return;
	}
	
	if( reg_password.test(pwd) == false ) {
		alert('비밀번호에 영문(한글)+숫자+특문 포함해주세요.');
		$("#pwd").focus();
		return;
	}
	
	if( address == '' ) {
		alert('주소를 입력하세요');
		$("#address").focus();
		return;
	}
	
	if( email == '' ) {
		alert('이메일을 입력하세요');
		$("#email").focus();
		return;
	}
	
	if( reg_email.test(email) == false ) {
		alert('올바른 이메일을 입력하세요.');
		$("#email").focus();
		return;
	}
	
	if( phone == '' ) {
		alert('전화번호를 입력하세요');
		$("#phone").focus();
		return;
	}
	
	if( reg_phone.test(phone) == false ) {
		alert('전화번호를 000-0000-0000 형식으로 입력해주세요');
		$("#phone").focus();
		return;
	}
	
	if( c_pwd != pwd ) {
		alert('패스워드가 다릅니다.');
		$("#pwd").focus();
		return;
	}
	
	if( position == '' ) {
		alert('직급을 선택하세요');
		$("#position").focus();
		return;
	}
	
	var url = 'user_register.do';
	
	//jQuery를 이용한 Ajax통신
	$.ajax( {
				type : "POST",
				url: url, 				//요청(서버)페이지
				data:{'name': name,
					  'regnumber': regnumber, 
					  'id': id,
					  'password': pwd,
					  'address': address,
					  'email': email,
					  'phone': phone,
					  'position': position }, 		//파라미터
				success:function(data){	
					//서버에서 전달된 데이터
					if( data == 'ok' ) {
						alert('회원가입완료!!');
						
						/* f.action = "user_manager.do";
						f.method = "post";
						f.submit(); */
						
					} else {
						alert('회원가입 실패!!\r\n관리자에게 문의하세요.');
					}
				},
				error:function(request,status,error){
					alert("code:" + request.status +
							"\n" + "message:" +
							request.responseText + 
							"\n" + "error:" + error);
				}
			} );
}
</script>
	
</body>
</html>