<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div id="page-wrapper" style="margin: 0; margin-left: 200px;">
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
						<div class="panel-body" style="height: 100%;">
						사용방법 : 부서 선택 후 결재선에 등록할 성명을 끌어서 결재선 표에 놔두면 됩니다.
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
						<div class="panel-heading">결재선</div>
						<form role="form">
						<div class="panel-body" style="height: 100%;">
							
								<table width="100%"
									class="table table-striped table-bordered table-hover" ondrop="drop_handler(event);" ondragover="dragover_handler(event);" >
									<tr height="70px;">
										<th width="20%"
											style="vertical-align: middle; text-align: center;">직위</th>
										<td width="20%" class="g_position_1" style="vertical-align: middle;" ></td>
										<td width="20%" class="g_position_2" style="vertical-align: middle;" ></td>
										<td width="20%" class="g_position_3" style="vertical-align: middle;" ></td>
										<td width="20%" class="g_position_4" style="vertical-align: middle;" ></td>
									</tr>
									<tr height="70px;">
										<th style="vertical-align: middle; text-align: center;">성명</th>
										<td class="name_1" style="vertical-align: middle;"></td>
										<td class="name_2" style="vertical-align: middle;"></td>
										<td class="name_3" style="vertical-align: middle;"></td>
										<td class="name_4" style="vertical-align: middle;"></td>
									</tr>
								</table>
							
							<a class="btn btn-default btn-lg" id="app_line_insert" onclick="return false;">
                        		등록
                       		</a>
                       		<a class="btn btn-default btn-lg" id="app_line_exit" onclick="href='main_page.do'">
                        		취소
                       		</a>
						</div>
						</form>
					</div>
				
				</div>
			</div>
		<!-- </div> -->
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
	
	<script src="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/js/addAccordion.js"></script>
	
	
	
	<script>
	
	function dragstart_handler(ev){
		
		ev.dataTransfer.setData("text/plain", ev.target.id);
		ev.dropEffect = "copy";
		
		for(var i = 1; i < 5; i++){
			if(Number($(".g_position_"+i).attr('name')) >= Number($("#"+ev.target.id).attr('class'))){
				alert("전에 등록한 직원 직급보다 높은 직원을 등록해야합니다.");
				return;
			}
		}
		
	}
	
	function dragover_handler(ev) {
		 ev.preventDefault();
		 // Set the dropEffect to move
		 ev.dataTransfer.dropEffect = "copy";
		 
		}
		function drop_handler(ev) {
		ev.dataTransfer.dropEffect = "copy";
		var idx = ev.dataTransfer.getData("text");
		$.ajax({
			url : "check_line.do",
			data : {'idx' : idx },
			success:function(data){
				
					console.log(data);
				
					var id = "", id2=""; 
				
					if($(".g_position_1").text()==""){
						id = ".g_position_1";
						id2 = ".name_1";
						
					}else if($(".g_position_1").text()!="" && $(".g_position_2").text()==""){
						id = ".g_position_2";
						id2 = ".name_2";
						
					}else if($(".g_position_2").text()!="" && $(".g_position_3").text()==""){
						id = ".g_position_3";
						id2 = ".name_3";
						
					}else if($(".g_position_3").text()!="" && $(".g_position_4").text()==""){
						id = ".g_position_4";
						id2 = ".name_4";
						
					}
					
					if(id != "" && id2 !=""){
						$(id).attr("name", data.g_level);
						$(id).attr("id",idx);
						$(id).attr("ondblclick",app_line_re(event));
						$(id).append(data.g_position);
						$(id2).append(data.name);
					}
					
				}
		 }); 
		
	}
	
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
						var s = document.createElement("script");
						
						$('[name=company_line_list]').append("<div data-addui='accordion'><div role='header'>"+user_data[0].c_name+"</div><div role='content'><table class='table table-striped table-bordered table-hover' name='user_name'><tr align='center' height='60px;'><th style='vertical-align: middle; text-align: center;'>직위</th><th style='vertical-align: middle; text-align: center;'>성명</th></tr></table></div></div>");
						for(var i = 0; i < user_data.length ; i++){
							
							var g_name = "<tr height='30px;'><td style='vertical-align: middle; text-align: center;'>"+user_data[i].g_position+"</td><td style='vertical-align: middle; text-align: center;' name='user_data_name' id='"+user_data[i].idx+"' draggable='true' ondragstart='dragstart_handler(event);' class='"+user_data[i].g_level+"'>"+user_data[i].name+"</td></tr>"
							$('[name=user_name]').append(g_name);
							
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