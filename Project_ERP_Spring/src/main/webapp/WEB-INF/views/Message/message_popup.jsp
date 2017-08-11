<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<!-- Ajax를 이용하기위한 라이브러리 설정 -->
	<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.min.js"></script>

	<!-- sweetalert라이브러리 -->
	<script src="${ pageContext.request.contextPath }/resources/js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/sweetalert.css">

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
		

	<script type="text/javascript">
		/* 체크박스 전체 선택 */
		function checkAll(){
			if($("#th_checkAll").is(':checked')){
				$("input[name=checkRow]").prop("checked", true);
			}else{
				$("input[name=checkRow]").prop("checked", false);
			}
		}
				
		function find(){
			var search = document.getElementById("search").value;
			var search_text = document.getElementById("search_text").value;
			
			if(search!=''&&search_text==''){
				sweetAlert("알림!!", "검색어를 입력하세요!!", "error");
				document.getElementById("search_text").focus();
				return;
			}
			
			var url="popup_list.do";
			var param = "search="+search+"&search_text="+encodeURIComponent(search_text);
			
			location.href=url+"?"+param;
		}
		
		//초기화 함수
		window.onload=function(){
			var search_array = ['','c_name','g_position','name','id'];
			var search = '${ param.search }';
			var search_select = document.getElementById("search");
			for(var i=0;i<search_array.length;i++){
				if(search == search_array[i]){
					search_select[i].selected = true;
					break;
				}
			}
		};
		
		function select_check(){
			var list_checked = [];

			$("input[name=checkRow]:checked").each(function(checkbox){
				list_checked.push($(this).val());
			});
			
			if(list_checked == ''){
				sweetAlert("알림!!", "쪽지보낼 사람을 체크하세요!!", "error");
				//alert('보관할 쪽지를 체크하지 않았습니다!!');
				return;
			}
			
			opener.document.getElementById("pInput").value = list_checked; 
			
			window.close();
						
		}
		
	</script>

</head>
<body>
	
	<!-- 본문 내용 -->
	<div id="page-wrapper" style="height: 515px; padding-top: 20px">
		<!-- 검색 -->
		    <div class="row" style="margin-bottom: 20px;">    
		        <div class="col-xs-8 col-xs-offset-2">
				    
                       <div class="input-group custom-search-form" style="width: 80%; margin-left: 45px;">
	                       <select style="width: 25%; font-size: 10pt;" id=search class="form-control">
	                            <option value="">전체</option>
								<option value="c_name">부서</option>
								<option value="g_position">직책</option>
								<option value="name">이름</option>
								<option value="id">아이디</option>
	                        </select>
                            <input style="width: 75%; font-size: 10pt;" id="search_text" type="text" value="${ empty param.search ? '' : param.search_text }" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button style="height: 34px;" class="btn btn-default" type="button" onclick="find();">
                                      <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                        </div>		                
	                 
		        </div>
			</div>
		
		<!-- 리스트 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="margin: 0; min-width: 515px;">
					<div class="panel-body" style="height: 515px;">
						<table class="table table-striped table-bordered table-hover" id="dataTables-example">
							<thead>
								<tr>
									<th width="5%"><input id="th_checkAll" name="checkAll" type="checkbox" onclick="checkAll();"></th>
							        <th width="10%">부서</th>
							        <th width="10%">직책</th>
							        <th width="10%">이름</th>
							        <th width="10%">아이디</th>
								</tr>
							</thead>
							
							<c:if test="${ empty list }">
								<tr>
									<td colspan="5" align="center"><p style="color:balck;">사원정보가 없습니다.<p></td>
								</tr>
							</c:if>
							
							<tbody>
								<c:forEach var="vo" items="${ list }">
									<tr>
										<td><input id="checkRow" type="checkbox" name="checkRow" value="${ vo.id }"></td>
								        <td>${ vo.c_name }</td>
								        <td>${ vo.g_position }</td>
								        <td>${ vo.name }</td>
								        <td>${ vo.id }</td>
									</tr> 
								</c:forEach> 
							</tbody>
                        </table>
                        
					</div>
				</div>
			<!-- /.col-lg-12 -->
				
				<!-- 페이징 메뉴 -->
				<div style="height: 10px;" align="center">${ pageHtml }</div>
	            <div align="right" style="padding-bottom: 10px; padding-top: 10px">
				  <button style="width: 80px;" type="button" class="btn" onclick="select_check();">선택</button>        
				  <input type="hidden" id="cInput" value="${ param.input }">
				</div>  
			</div>
		<!-- /.row -->
		</div>
	<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	
</body>
</html>