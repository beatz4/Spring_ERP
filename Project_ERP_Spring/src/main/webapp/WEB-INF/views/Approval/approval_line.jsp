<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<style type="text/css">

td{
	vertical-align : middle; 
	text-align: center;
}

</style>
</head>
<body>
	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp" />

	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="side_menu.jsp" />

	<div id="page-wrapper">
		<!-- <div class="container"> -->
			<div class="row">
			<div class="col-lg-12" align="center">
				<h1 class="page-header">결재선 관리</h1>
			</div>
			</div>
			<div class="row">
			<div class="col-lg-12" align="center" >
					<div class="panel panel-default">
						<div class="panel-heading">How to use...</div>
							<div class="panel-body">
								<div align="left" style="width: 700px">
								① 결재선 삽입 : 부서 선택 후 결재선에 등록할 성명을 끌어서 원하는 순서 직급위에 놔두면 됩니다.</br>
								② 취소 : 등록 취소 하고 싶은 직원의 직위를 두번 클릭하면 됩니다.</br>
								③ 전체취소: 결재선제목을 두번 클릭시 전체취소 되고 새로고침 됩니다.</br>
								④ 등록 : 모든 결재선 성함을 채웠으면 등록버튼을 눌러 저장합니다.
								</div>
						</div>
					</div>
			</div> 
			</div>
			<div class="row">
			<!-- 좌측 트리 -->
			<div class="col-lg-6" align="center">
				<div class="panel panel-default">
					<div class="panel-heading">부서</div>
					<div class="panel-body" style="overflow:auto; height: 350px">

						<div data-addui='accordion'>
							<c:forEach var="com" items="${list }">
								<c:if test="${com.parent_idx eq '0' }">
									<div role='header'>${com.name }</div>

									<div role='content'>
										<table width="100%" class="table table-striped table-bordered table-hover">
										
										<c:forEach var="pany" items="${list }">
										<tr style="vertical-align: middle;">
											<c:if
												test="${pany.parent_idx != '0' && pany.parent_idx == com.id }">
												<td name="company_user" class="${pany.idx }">${pany.name }</td>
											</c:if>
										<tr>
										</c:forEach>
										
										</table>
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
					<div class="panel-body" name="company_line_list" style="height: 350px; overflow:auto;"></div>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-lg-12" align="center">
					<div class="panel panel-default">
						<div class="panel-heading" ondblclick="window.location.reload()">결재선</div>
						<form role="form">
							<div class="panel-body" style="height: 100%;">
								
									<table width="100%"
										class="table table-striped table-bordered table-hover" ondrop="drop_handler(event);" ondragover="dragover_handler(event);" >
										<tr height="70px;">
											<th width="20%"
												style="vertical-align: middle; text-align: center;">직급</th>
											<td width="20%" class="g_position_1" style="vertical-align: middle;"></td>
											<td width="20%" class="g_position_2" style="vertical-align: middle;"></td>
											<td width="20%" class="g_position_3" style="vertical-align: middle;"></td>
											<td width="20%" class="g_position_4" style="vertical-align: middle;"></td>
										</tr>
										<tr height="70px;" >
											<th style="vertical-align: middle; text-align: center;">성명</th>
											<td class="name_g_position_1" style="vertical-align: middle;"></td>
											<td class="name_g_position_2" style="vertical-align: middle;"></td>
											<td class="name_g_position_3" style="vertical-align: middle;"></td>
											<td class="name_g_position_4" style="vertical-align: middle;"></td>
										</tr>
									</table>
								
								<a class="btn btn-default btn-lg" onclick="app_line_insert()">
	                        		등록
	                       		</a>
	                       		<a class="btn btn-default btn-lg" onclick="main()">
	                        		메인
	                       		</a>
							</div>
						</form>
					</div>
				
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
	<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/sb-admin-2.js"></script>
	
	<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/addAccordion.js"></script>
	
	<script>
	function app_line_insert(){
		var a_line_name = prompt("제목을 입력하세요:", "내결제선_1");
		if(a_line_name== null || a_line_name == ""){
			a_line_name = "내결재선_1";
		}
		var idx_one = 0;
		var idx_two = 0;
		var idx_three =0;
		var idx_four = 0;
		
		if($(".g_position_1").attr("id") != null ){
			idx_one = $(".g_position_1").attr("id");
		}
		if( $(".g_position_2").attr("id")!= null){
			idx_two = $(".g_position_2").attr("id");
		}
		if($(".g_position_3").attr("id") != null){
			idx_three = $(".g_position_3").attr("id");
		}
		if($(".g_position_4").attr("id") != null){
			idx_four = $(".g_position_4").attr("id");
		}
		
		
		$.ajax({
			url : "app_line_insert.do",
			data : {'a_line_name':a_line_name, 'idx_one': idx_one, "idx_two":idx_two, "idx_three":idx_three, "idx_four":idx_four},
			success:function(data){
					alert(data);			
			}	
			
		})	 
		
	}
	
	
	function main(){
		
		var cf = confirm("모두 취소하고 전자결재 매인페이지로 돌아가시겠습니가?");
		if( cf == true){
			location.href="main_page.do";
		}
	}
	
	
	function dblclick_handler([className]){
		
		var cf = confirm("등록을 취소하시겠습니까?");
		if(cf == true){
			var g_position_class = "."+className;
			var name_class =".name_"+className;
			$(g_position_class).text("");
			var name_idx=$(g_position_class).attr("id");
			console.log(name_idx)
			$(name_class).text(""); 
			$("#"+name_idx).attr("draggable", true);
		}
	}
	
	
	function dragstart_handler(ev){
		
		ev.dataTransfer.setData("text/plain", ev.target.id);
		ev.dropEffect = "move";
		
	}
	
	function dragover_handler(ev) {
		 ev.preventDefault();
		 // Set the dropEffect to move
		 ev.dataTransfer.dropEffect = "move";
		 
		}
		function drop_handler(ev) {
		var idx_check = 0;
		var idx_check_name = ev.target.className;
		var idx_check_str = ev.target.className.substr(11,1);
		if(idx_check_str >= 2){
			idx_check_name = ".g_position_"+(idx_check_str-1);
			idx_check = $(idx_check_name).attr('id');
			console.log(idx_check);
		}

		if($("."+ev.target.className).text() != ""){
			idx_check = $(idx_check_name).attr('id');
			console.log(idx_check);
		}
		
		ev.dataTransfer.dropEffect = "copy";
		var idx = ev.dataTransfer.getData("text");
		
		$.ajax({
			url : "check_line.do",
			data : {'idx' : idx , 'idx_check' : idx_check},
			success:function(data){
					
					var user_check = eval(data);
					var g_position_class = "."+ev.target.className;
					var name_class =".name_"+ev.target.className; 
					
					if(user_check[0].result == "ok"){
						var cf = "";
						if(g_position_class.indexOf("name")!=-1){
							alert("직위에 내려놔야 등록이 가능합니다.");
							return;
						}
						
						if( $(g_position_class).attr('name') < user_check[0].g_level){
							cf = confirm("새로 등록 하시겠습니까?");
						}else{
							cf = confirm("등록 하시겠습니까?");
						}
						 	
							if(cf == true){
								$(g_position_class).text("");
								$(name_class).text("");
								$(g_position_class).attr("name", user_check[0].g_level);
								$(g_position_class).attr("id", user_check[0].idx);
								$(g_position_class).append(user_check[0].g_position);
								$(name_class).append(user_check[0].name);
								$(g_position_class).attr("ondblclick","dblclick_handler([className])")
								$("#"+user_check[0].idx).attr("draggable", false);
							}
						
								
					}else if(user_check[0].result =="nok"){
						
						alert("전에 등록한 근무자보다 높은 직급의 사람만 등록 가틍 합니다.");
						
					}
					
				}
		 }); 
		
	}
	
	$(document).ready(function(){
		
		$('[name=company_user]').on('click',function(){
			
			var idx =$(this).attr('class');
			$.ajax({
				url : "approval_line.do",
				data :{'idx' : idx},
				success :function(data){
					
					$('[name=company_line_list] div').remove();
					var user_data = eval(data);
					
					if(user_data.length!=0){
						var s = document.createElement("script");
						
						$('[name=company_line_list]').append("<div data-addui='accordion'><div role='header'>"+user_data[0].c_name+"</div><div role='content'><table class='table table-striped table-bordered table-hover' name='user_name'><tr align='center' height='60px;'><th style='vertical-align: middle; text-align: center;'>직위</th><th style='vertical-align: middle; text-align: center;'>성명</th></tr></table></div></div>");
						for(var i = 0; i < user_data.length ; i++){
							var g_name = "<tr height='30px;'><td style='vertical-align: middle; text-align: center;'>"+user_data[i].g_position+"</td><td style='vertical-align: middle; text-align: center;' name='user_data_name' id='"+user_data[i].idx+"' draggable='true' ondragstart='dragstart_handler(event);' class='"+user_data[i].g_level+"'>"+user_data[i].name+"</td></tr>"
							$('[name=user_name]').append(g_name);
							/* $('.'+user_data[i].g_level).attr('name', ); */
						}
						s.type = "text/javascript";
						
						s.src = "${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/addAccordion.js";
						
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