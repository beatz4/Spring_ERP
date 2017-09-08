<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 메뉴 불러오기 -->
	<jsp:include page="../../main/main_index.jsp" />

	<!-- 사이드 메뉴 불러오기 -->
	<jsp:include page="../side_menu.jsp" />
	<div id="page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" align="center">지출결의서</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<form role="form" id="form">
				<div class="row" style="height: 220px;">
					<div class="panel-body" style="height: 100%;">
						<div class="col-lg-5 col-lg-offset-7" style="height: 100%;">
							<table width="100%" class="table table-striped table-bordered table-hover" height="100%" onclick="app_line();">
								<tr height="18%">			
									<td align="center" rowspan="4" style="vertical-align: middle;" width="8%">결재</td>
									<td align="center" class="g_position_1" width="23%" data-toggle="${line_vo.idx_one }" name="${vo.d_expense_idx }">${line_vo.g_position_one }</td>
									<td align="center" class="g_position_2" width="23%" data-toggle="${line_vo.idx_two }">${line_vo.g_position_two }</td>
									<td align="center" class="g_position_3" width="23%" data-toggle="${line_vo.idx_three }">${line_vo.g_position_three }</td>
									<td align="center" class="g_position_4" width="23%" data-toggle="${line_vo.idx_four }">${line_vo.g_position_four }</td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${user_vo.app_one eq 1 }">
											<td class="${user_vo.app_one }"><img src="${ pageContext.request.contextPath }/resources/image/success.jpg" width="70px" height="67px" ></td>
										</c:when>
										<c:when test="${user_vo.app_one eq 2 }">
											<td class="${user_vo.app_one }"><img src="${ pageContext.request.contextPath }/resources/image/fail.png" width="70px" height="67px" ></td>
										</c:when>
										<c:otherwise>
											<td class="${user_vo.app_one }"></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${user_vo.app_two eq 1 }">
											<td class="${user_vo.app_two }" style="margin: 0px"><img src="${ pageContext.request.contextPath }/resources/image/success.jpg" width="70px" height="67px" ></td>
										</c:when>
										<c:when test="${user_vo.app_two eq 2 }">
											<td class="${user_vo.app_two }" style="margin: 0px"><img src="${ pageContext.request.contextPath }/resources/image/fail.png" width="70px" height="67px" ></td>
										</c:when>
										<c:otherwise>
											<td class="${user_vo.app_two }"></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${user_vo.app_three eq 1 }">
											<td class="${user_vo.app_three }"><img src="${ pageContext.request.contextPath }/resources/image/success.jpg" width="70px" height="67px"></td>
										</c:when>
										<c:when test="${user_vo.app_three eq 2 }">
											<td class="${user_vo.app_three }"><img src="${ pageContext.request.contextPath }/resources/image/fail.png" width="70px" height="67px"></td>
										</c:when>
										<c:otherwise>
											<td class="${user_vo.app_three }"></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${user_vo.app_four eq 1 }">
											<td class="${user_vo.app_four }"><img src="${ pageContext.request.contextPath }/resources/image/success.jpg" width="70px" height="67px"></td>
										</c:when>
										<c:when test="${user_vo.app_four eq 2 }">
											<td class="${user_vo.app_four }"><img src="${ pageContext.request.contextPath }/resources/image/fail.png" width="70px" height="67px"></td>
										</c:when>
										<c:otherwise>
											<td class="${user_vo.app_four }"></td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr height="15%">			
									<td align="center" class="name_g_position_1">${line_vo.user_name_one }</td>
									<td align="center" class="name_g_position_2">${line_vo.user_name_two }</td>
									<td align="center" class="name_g_position_3">${line_vo.user_name_three }</td>
									<td align="center" class="name_g_position_4">${line_vo.user_name_four }</td>
								</tr>
								<tr height="15%">			
									<td>${user_vo.app_one_date }</td>
									<td>${user_vo.app_two_date }</td>
									<td>${user_vo.app_three_date }</td>
									<td>${user_vo.app_four_date }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			
				<div class="row">
					<!-- <div class="col-lg-12"> -->
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-lg-12">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="approval_1">
									<tr>
										<th width="10%" class="text-center"
											style="vertical-align: middle;">부서</th>
										<td class="text-center" width="23%"
											style="vertical-align: middle;">
											<div class="form-group">
												<input class="form-control"
													style="font-size: 15px" name="c_name" value="${user_vo.c_name }" disabled>
											</div>
										</td>
									
										<th width="10%" class="text-center"
											style="vertical-align: middle;">성명</th>
										<td class="text-center" width="23%"
											style="vertical-align: middle;">
											<div class="form-group">
												<input class="form-control"
													style="font-size: 15px" name="name" value="${user_vo.name }" disabled>
											</div>
										</td>
									
										<th width="10%" class="text-center"
											style="vertical-align: middle;">*신청날짜</th>
										<td width="23%" style="vertical-align: middle;">
										<div class="form-group" >
		                                     <input id="todaydatepicker" name="d_expense_regdate" class="form-control" style="font-size: 15px;" placeholder="선택하세요" value="${vo.d_expense_regdate }">
		                                </div>
		                                </td>
									</tr>
								</table>
							</div>
								
							<div class="col-lg-12">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="approval_2">
									<tr>
										<th width="12%" class="text-center"
											style="vertical-align: middle;">*제목</th>
										<td class="text-center" width="38%">
											<div class="form-group">
												<input class="form-control"
													style="font-size: 15px" name="d_expense_title" value="${user_vo.app_document_title }">
											</div>
										</td>
										<th width="12%" class="text-center"
											style="vertical-align: middle;">*지급요청일</th>
										<td class="text-center" width="38%">
											<div class="form-group">
												<input name="d_expense_date"  class="form-control" style="font-size: 15px;" placeholder="선택하세요" value="${vo.d_expense_date }">
											</div>
										</td>
									</tr>
									<tr>
										<th class="text-center"
											style="vertical-align: middle;">*계좌번호(은행)</th>
										<td class="text-center">
											<div class="form-group">
												<input class="form-control" 
													style="font-size: 15px" name="d_expense_acnumber" value="${vo.d_expense_acnumber }">
											</div>
										</td>
										<th class="text-center"
											style="vertical-align: middle;">*예금주</th>
										<td>
											<div class="form-group">
												<input class="form-control" 
													style="font-size: 15px" name="d_expense_acname" value="${vo.d_expense_acname }">
											</div>
										</td>
									</tr>
									<tr>
										<th class="text-center"
											style="vertical-align: middle;">합계금액</th>
										<td class="text-center">
											<div class="form-group">
												<input class="form-control"
													style="font-size: 15px" name="d_expense_total"  numberOnly placeholder="0" value="${vo.d_expense_total }">
											</div>
										</td>
										<th class="text-center"
											style="vertical-align: middle;">*지급조건</th>
										<td>
											<div class="form-group">
												<input class="form-control" 
													style="font-size: 15px" name="d_expense_tpay" value="${vo.d_expense_tpay }">
											</div>
										</td>
									</tr>
		
								</table>
							</div>
							<div class="col-lg-12">
								<table width="100%"
									class="table table-striped table-bordered table-hover" id="approval_content" >
									<tr>
										<th width="12%" class="text-center"
											style="vertical-align: middle;">*계정과목</th>
										<th width="11%" class="text-center"
											style="vertical-align: middle;">*지출일</th>
										<th width="11%" class="text-center"
											style="vertical-align: middle;">*지출내용</th>
										<th width="11%" class="text-center"
											style="vertical-align: middle;">*거래처</th>
										<th width="12%" class="text-center"
											style="vertical-align: middle;">*금액</th>
										<th width="11%" class="text-center"
											style="vertical-align: middle;">*결제수단</th>
										<th width="11%" class="text-center"
											style="vertical-align: middle;">비고</th>
										<th width="11%" class="text-center"
											style="vertical-align: middle;">증빙</th>
										
									</tr>
								<c:forEach var="c_vo" items="${content_vo }">
									<tr>
										<td class="text-center">
											<div class="form-group">
												<input name="t_expense_idx_${c_vo.t_expense_idx }" class="form-control" 
													style="font-size: 15px;" value="${c_vo.t_expense_title }">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input name="c_expense_date" class="form-control" placeholder="선택하세요"
													style="font-size: 15px;" value="${c_vo.c_expense_date}">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input class="form-control" style="font-size: 15px"
													name="c_expense_content" value="${c_vo.c_expense_content}">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input class="form-control" style="font-size: 15px"
													name="c_expense_customer" value="${c_vo.c_expense_customer}">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input class="form-control" style="font-size: 15px"
													name="c_expense_money" numberOnly placeholder="0" value="${c_vo.c_expense_money}">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input class="form-control" style="font-size: 15px"
													name="c_expense_mepay" value="${c_vo.c_expense_mepay}">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input class="form-control" style="font-size: 15px"
													name="c_expense_et" value="${c_vo.c_expense_et}">
											</div>
										</td>
										<td>
											<div class="form-group">
												<input class="form-control" style="font-size: 15px"
													name="c_expense_proof" value="${c_vo.c_expense_proof}">
											</div>
										</td>
										
									</tr>
								</c:forEach>
								</table>
							</div>
							</div>
						</div>
					</div>
				<!-- </div> -->
				<c:if test="${user_vo.d_condition eq 1 and user_vo.idx != user_vo.next_idx }">
					<div class="col-lg-12" align="center">
						<button type="button" class="btn btn-primary" onclick="expense_app(this.form);">결재하기</button>
						<button type="button" class="btn btn-primary" onclick="expense_cancle(this.form);">반려하기</button>
					</div>
				</c:if>
			</form>
		</div>
	</div>
<script>

	
	$(document).ready(function(){
		
		$("input").attr("readonly", true);
		$("td").attr("align", "center");
		$("td").css("vertical-align", "middle");
		$(".form-group").css("margin","0");
	});
	
	function expense_app(f){
		
		var cf = confirm("결재 하시겠습니까?")
		
		if(cf = true){
			
			var app_d_idx = ${user_vo.app_d_idx};
			var next_idx = stay;
			var app_one = 0;
			var app_two = 0;
			var app_three =0;
			var app_four = 0;
			var d_condition = 1;
			
			if(${user_vo.app_one} == 1){
				next_idx = $(".g_position_3").attr("data-toggle");
				app_one = 1;
				app_two = 1;
				if(next_idx != 0){
					d_condition = 1;
				}else{
					d_condition = 3;
				}
			}
			if(${user_vo.app_two} == 1){
				next_idx = $(".g_position_4").attr("data-toggle");
				app_one = 1;
				app_two = 1;
				app_three =1;
				if(next_idx != 0){
					d_condition = 1;
				}else{
					d_condition = 3;
				}
			}
			if(${user_vo.app_three} == 1){
				next_idx = 0;
				app_one = 1;
				app_two = 1;
				app_three = 1;
				app_four = 1;
				d_condition = 3;
			}
					
			$.ajax({
				url : "expense_app.do",
				data: {
					   'app_d_idx'     	   : app_d_idx,
					   'next_idx'          : next_idx,
					   'app_one'		   : app_one,
					   'app_two'		   : app_two,
					   'app_three'		   : app_three,
					   'app_four'		   : app_four,
					   'd_condition'	   : d_condition
					   
				},
				success : function(data){
					console.log(data);
				}
				
			});
		}
		
	}
	function expense_cancle(f){
		
		
		var cf = confirm("반려 하시겠습니까?")
		
		if(cf = true){
			
			var app_d_idx = ${user_vo.app_d_idx};
			var next_idx = 0;
			var app_one = 0;
			var app_two = 0;
			var app_three =0;
			var app_four = 0;
			var d_condition = 2;
			
			if(${user_vo.app_one} == 1){
				next_idx = 0;
				app_one = 1;
				app_two = 2;
				d_condition = 2;
				
			}
			if(${user_vo.app_two} == 1){
				next_idx = 0;
				app_one = 1;
				app_two = 1;
				app_three =2;
				d_condition = 2;
			}
			if(${user_vo.app_three} == 1){
				next_idx = 0;
				app_one = 1;
				app_two = 1;
				app_three = 1;
				app_four = 2;
				d_condition = 2;
			}
			$.ajax({
				url : "expense_cancel.do",
				data: {
					   'app_d_idx'     	   : app_d_idx,
					   'next_idx'          : next_idx,
					   'app_one'		   : app_one,
					   'app_two'		   : app_two,
					   'app_three'		   : app_three,
					   'app_four'		   : app_four,
					   'd_condition'	   : d_condition
					   
				},
				success : function(data){
					console.log(data);
				}
				
			});
		}
		
	}


</script> 

</body>

</html>