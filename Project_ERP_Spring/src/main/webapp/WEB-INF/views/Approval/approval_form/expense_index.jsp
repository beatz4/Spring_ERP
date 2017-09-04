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

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" align="center">지출결의서</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<form role="form">
		<div class="row" style="height: 200px;">
			<div class="panel-body" style="height: 100%;">
				<div class="col-lg-5 col-lg-offset-7" style="height: 100%;">
					<table width="100%" class="table table-striped table-bordered table-hover" height="100%" onclick="app_line();">
						<tr height="18%">			
							<td align="center" rowspan="4" style="vertical-align: middle;" width="8%">결재</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>			
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr height="15%">			
							<td></td>
							<td></td>
							<td></td>
							<td></td>
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
	</form>
	
	<form role="form">
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
                                     <input id="todaydatepicker" name="d_expense_regdate" class="form-control" style="font-size: 15px;" placeholder="선택하세요" >
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
											style="font-size: 15px" name="d_expense_title">
									</div>
								</td>
								<th width="12%" class="text-center"
									style="vertical-align: middle;">*지급요청일</th>
								<td class="text-center" width="38%">
									<div class="form-group">
										<input name="d_expense_date"  class="form-control" style="font-size: 15px;" placeholder="선택하세요">
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center"
									style="vertical-align: middle;">*계좌번호(은행)</th>
								<td class="text-center">
									<div class="form-group">
										<input class="form-control" 
											style="font-size: 15px" name="d_expense_acnumber">
									</div>
								</td>
								<th class="text-center"
									style="vertical-align: middle;">*예금주</th>
								<td>
									<div class="form-group">
										<input class="form-control" 
											style="font-size: 15px" name="d_expense_acname">
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center"
									style="vertical-align: middle;">합계금액</th>
								<td class="text-center">
									<div class="form-group">
										<input class="form-control"
											style="font-size: 15px" name="d_expense_total"  numberOnly placeholder="0" disabled>
									</div>
								</td>
								<th class="text-center"
									style="vertical-align: middle;">*지급조건</th>
								<td>
									<div class="form-group">
										<input class="form-control" 
											style="font-size: 15px" name="d_expense_tpay">
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
								<th width="4%" class="text-center"
									style="vertical-align: middle;">삭제</th>
							</tr>
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
	

<script>
	function app_line(){
		
		var popupX = (window.screen.width / 2) - (1200 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height /2) - (800 / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
							
		window.open("app_line_index.do", "pop", 'status=no, height=800, width=1200, resizable=no, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		
	}

	function expense_add(f){
		
		var d_expense_regdate = f.d_expense_regdate.value;
		var d_expense_title = f.d_expense_title.value;
		var d_expense_date =f.d_expense_date.value;
		var d_expense_acnumber = f.d_expense_acnumber.value;
		var d_expense_acname = f.d_expense_acname.value;
		var d_expense_total = f.d_expense_total.value;
		var d_expense_tpay = f.d_expense_tpay.value;
		
		$.ajax({
			url : "expense_insert.do",
			data: {'idx' 		       : ${app_user_list.idx},
				   'd_expense_regdate' : d_expense_regdate,
				   'd_expense_title'   : d_expense_title,
				   'd_expense_date'    : d_expense_date,
				   'd_expense_acnumber': d_expense_acnumber,
				   'd_expense_acname'  : d_expense_acname,
				   'd_expense_total'   : d_expense_total,
				   'd_expense_tpay'    : d_expense_tpay
			},
			success : function(data){
				expense_add();
			}
			
		});
	}
	
	function expense_add(){
		
		var size = $("[name='t_expense_idx']").length;
		console.log(size);
		
		for( var i = 0; i < size; i++)
		{
			$.ajax({
				url : "expense_content_insert.do",
				data : {'t_expense_idx' 	: $("[name=t_expense_idx]").eq(i).val(),
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
	
	//총 금액계산기 및 돈 콤마
	function money_blur(){
		 
		 $('[name = c_expense_money]').blur(function(){
   		 
   		 var size = $("[name='c_expense_money']").length;
   		 var total = 0;
   		 
   		 for(var i = 0 ; i < size; i++){
          	$('[name=c_expense_money]').number(true);
          	$.number($('[name=c_expense_money]').eq(i).val());
          	total += Number($('[name=c_expense_money]').eq(i).val());     
          } 
   		 
       	 $("[name=d_expense_total]").number(true);
       	 $.number($("[name=d_expense_total]").val(total));
       	 
   	 });
		 
	 }
	
	//날짜선택기 메서드
	function datepicker(){
		
		 var size = $("[name='c_expense_date']").length;
   		
  		 for(var i = 0 ; i < size; i++){
      		 
  			 $('[name=c_expense_date]').eq(i).datepicker({
  				 calendarWeeks: false,
  			     todayHighlight: true,
  			     autoclose: true,
  			     format: "yyyy/mm/dd",
  			     language: "kr" 
  			 });
  	        
      	 } 
	}
	
	//content append메서드
	function contentadd(){
		
		$.ajax({ 
				 type: 'GET',
		         url:'insert_content.do',             //요청(서버)페이
		         success:function(data){
		        	 //서버에서 전달된 데이터	
		        	 $('#approval_content > tbody:last').append(data);
		        	 money_blur();
		        	 datepicker();
		         }
		        });
	}
	
//화면 새로고침 후 시작되는 function
 $(document).ready(function(){
	 var cnt = 0;
	 
	 if(cnt == 0){
		contentadd();
		cnt++;
	 }
		
	 $('#formadd').on('click', function () {
			if(cnt < 5){
			contentadd();	
			cnt++;
			}else{
				 alert('5개 이상 추가할 수 없습니다.');
			}
	 });
	 
	 //삭제버튼 클릭시(증가된 content삭제)
	 $('#approval_content').on('click','i',function(){
		 
		 cnt--;
		 
		 $(this).closest("tr").remove();
		
		 //content 1가 없어졌을때 총금액 계산
		 var size = $("[name='c_expense_money']").length;
		 var total = 0;
		 for(var i = 0 ; i < size; i++){
      		 
      		 total += Number($('[name=c_expense_money]').eq(i).val());
  	        
      	 } 
		 console.log(total);
		 $.number($("[name=d_expense_total]").val(total));
		 
	 });
	
	 //datepicker 기능
	 $('#todaydatepicker, [name=d_expense_date], [name=c_expense_date]').datepicker({
		 calendarWeeks: false,
	     todayHighlight: true,
	     autoclose: true,
	     format: "yyyy/mm/dd",
	     language: "kr"
	 });
	 
	 
	

	  $('#approval_line').on('click', function(){
		  
		 $('.bs-example-modal-lg').focus();
		 window.open("insert_app_line.do", "pop", 'status=no, height=800, width=1200, resizable=no, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY); 
	 }); 
	 
 });	

</script> 
	
</body>

</html>