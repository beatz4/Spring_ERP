<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- sweetalert라이브러리 -->
	<script src="${ pageContext.request.contextPath }/resources/js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/sweetalert.css">

	<script type="text/javascript">
		/* 체크박스 전체 선택 */
		function checkAll(){
			if($("#th_checkAll").is(':checked')){
				$("input[name=checkRow]").prop("checked", true);
			}else{
				$("input[name=checkRow]").prop("checked", false);
			}
		}
		
		function select_delete(){
			var list_checked = [];
			
			$("input[name=checkRow]:checked").each(function(checkbox){
				list_checked.push($(this).val());
			});
			
			if(list_checked == ''){
				sweetAlert("알림!!", "삭제할 쪽지를 체크하세요!!", "error");
				return;
			}
			
			$.ajax({
				type: "GET",
				url : "delete.do",
				data : {"list_checked" : list_checked},
				seccess : function(data){
					
				},
				error : function(request, status, error){
					
				}
			});
			
			swal({
				  title: "쪽지를 삭제하시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "삭제하기",
				  cancelButtonText: "취소",
				  closeOnConfirm: false,
				  allowEscapeKey: true
				},
				
				function(){
					location.href='box_list.do';
				});
			
		}
	</script>

</head>
<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp"/>
	
	<!-- 서브 메뉴 -->
	<jsp:include page="message_index.jsp" />
	
	<!-- 본문 내용 -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">받은쪽지함</h1>
			</div>
		</div>
	
		<div align="left" style="padding-bottom: 10px">
		  <button style="width: 80px;" type="button" class="btn" onclick="select_delete();">삭제</button>    
		</div>
		<div class="panel panel-default" style="margin: 0; min-width: 500px; min-height: 590px;">
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover" id="dataTables-example" style="text-align: center;">
					<thead>
						<tr>
							<th width="2%" style="text-align: center;"><input id="th_checkAll" name="checkAll" type="checkbox" onclick="checkAll();"></th>
					        <th width="8%" style="text-align: center;">보낸사람</th>
					        <th width="8%" style="text-align: center;">받은사람</th>
					        <th width="70%" style="text-align: center;">제목</th>
					        <th width="10%" style="text-align: center;">받은날짜</th>
						</tr>
					</thead>
					
					<c:if test="${ empty list }">
						<tr>
							<td colspan="5" align="center"><p style="color:balck;">쪽지가 없습니다.<p></td>
						</tr>
					</c:if>
					
					<tbody>
						<c:forEach var="vo" items="${ list }">
							<tr>
								<td><input id="checkRow" type="checkbox" name="checkRow" value="${ vo.idx }"></td>
						        <td><a href="insert_form.do?send_id=${ vo.send_id }">${ vo.send_id }</a></td>
						        <td><a href="insert_form.do?send_id=${ vo.recv_id }">${ vo.recv_id }</a></td>
						        <td><a href="view.do?idx=${ vo.idx }&select=${ param.select }">${ vo.title }</a></td>
						      	<td>${ vo.send_date }</td>
							</tr> 
						</c:forEach> 
					</tbody>
                </table>                        	
			</div>
		</div>
		<!-- 페이징 메뉴 -->
		<div align="center">${ pageHtml }</div>
	</div>
</body>
</html>