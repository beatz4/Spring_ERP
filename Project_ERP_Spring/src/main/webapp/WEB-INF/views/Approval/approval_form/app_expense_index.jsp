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
<style>
	.form-group{
		margin: 0;
	}
</style>
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
									<td align="center" class="g_position_1" width="23%">${line_vo.g_position_one }</td>
									<td align="center" class="g_position_2" width="23%">${line_vo.g_position_two }</td>
									<td align="center" class="g_position_3" width="23%">${line_vo.g_position_three }</td>
									<td align="center" class="g_position_4" width="23%">${line_vo.g_position_four }</td>
								</tr>
								<tr>			
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr height="15%">			
									<td align="center" class="name_g_position_1">${line_vo.user_name_one }</td>
									<td align="center" class="name_g_position_2">${line_vo.user_name_two }</td>
									<td align="center" class="name_g_position_3">${line_vo.user_name_three }</td>
									<td align="center" class="name_g_position_4">${line_vo.user_name_four }</td>
								</tr>
								<tr height="15%">			
									<td></td>
									<td></td>
									<td></td>
									<td></td>
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
													style="font-size: 15px" name="c_name" value="${app_user_list.c_name }" disabled>
											</div>
										</td>
									
										<th width="10%" class="text-center"
											style="vertical-align: middle;">성명</th>
										<td class="text-center" width="23%"
											style="vertical-align: middle;">
											<div class="form-group">
												<input class="form-control"
													style="font-size: 15px" name="name" value="${app_user_list.name }" disabled>
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
													style="font-size: 15px" name="d_expense_title" value="${vo.d_expense_title }">
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
				<div class="col-lg-12" align="center">
					<button type="button" id="formadd" class="btn btn-primary">추가하기</button>
					<button type="button" class="btn btn-primary" onclick="expense_add(this.form);">기안하기</button>
				</div>	
			</form>
		</div>
	</div>
<script>

	$(document).ready(function(){
		
		$("input").attr("readonly", true);
		
		
	});
	function expense_add(f){
		
		var app_d_idx = $(".g_position_1").attr("name");
		var next_idx = $(".g_position_2").attr("data_toggle");
		var d_expense_regdate = f.d_expense_regdate.value;
		var d_expense_title = f.d_expense_title.value;
		var d_expense_date =f.d_expense_date.value;
		var d_expense_acnumber = f.d_expense_acnumber.value;
		var d_expense_acname = f.d_expense_acname.value;
		var d_expense_total = f.d_expense_total.value;
		var d_expense_tpay = f.d_expense_tpay.value;
		var app_one = 1;
		var app_two = 0;
		var app_three =0;
		var app_four = 0;
		var d_condition = 1;
		
		$.ajax({
			url : "expense_insert.do",
			data: {
				   'next_idx'          : next_idx,
				   'app_d_idx'		   : app_d_idx,
				   'd_expense_regdate' : d_expense_regdate,
				   'd_expense_title'   : d_expense_title,
				   'd_expense_date'    : d_expense_date,
				   'd_expense_acnumber': d_expense_acnumber,
				   'd_expense_acname'  : d_expense_acname,
				   'd_expense_total'   : d_expense_total,
				   'd_expense_tpay'    : d_expense_tpay,
				   'app_one'		   : app_one,
				   'app_two'		   : app_two,
				   'app_three'		   : app_three,
				   'app_four'		   : app_four,
				   'd_condition'	   : d_condition
				   
			},
			success : function(data){
				if(data != -1){
					expense_add_content(data);
				}else{
					alert("오류 발생!!");
				}
				
			}
			
		});
	}
	
	function expense_add_content(d_expense_idx){
		
		var size = $("[name='t_expense_idx']").length;
		
		for( var i = 0; i < size; i++)
		{
			$.ajax({
				url : "expense_content_insert.do",
				data : {'t_expense_idx' 	: $("[name=t_expense_idx]").eq(i).val(),
						'd_expensd_idx'     : d_expense_idx,
				        'c_expense_date'    : $("[name=c_expense_date]").eq(i).val(), 
				        'c_expense_content' : $("[name=c_expense_content]").eq(i).val(),
				        'c_expense_customer': $("[name=c_expense_customer]").eq(i).val(),
				        'c_expense_money'   : $("[name=c_expense_money]").eq(i).val(),
				        'c_expense_mepay'   : $("[name=c_expense_mepay]").eq(i).val(),
				        'c_expense_et'   	: $("[name=c_expense_et]").eq(i).val(),
				        'c_expense_proof'   : $("[name=c_expense_proof]").eq(i).val()        
				        },
				success: function(data){
					
				}
			}); 
		} 	
		
	}


</script> 

</body>

</html>