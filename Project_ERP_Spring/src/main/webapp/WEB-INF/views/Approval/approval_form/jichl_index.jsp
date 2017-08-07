<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.form-group{
height: 25px;
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
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover" id="approval" >
						<tr>
							<th width="10%" class="text-center"  style="vertical-align: middle;">부서</th>
							<td class="text-center" width="23%">
								<div class="form-group">
                                   	<select class="form-control" style="font-size: 15px">
                                       	<option>1</option>
                                       	<option>2</option>
                                       	<option>3</option>
                                       	<option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
							</td>
							<th width="10%" class="text-center" style="vertical-align: middle;">성명</th>
							<td>
								<div class="form-group">
                                     <input class="form-control" value="홍길동" style="font-size: 15px">
                                </div>
							</td>
							<th width="10%" class="text-center" style="vertical-align: middle;">신청날짜</th>
							<td width="23%">
								<div class="form-group">
                                     <input class="form-control" value="2017.07.25" style="font-size: 15px">
                                </div>
							</td>
						</tr>
                   		</table>
                   		<table width="100%" class="table table-striped table-bordered table-hover" id="approval" >
						<tr>
							<th width="10%" class="text-center"  style="vertical-align: middle;">제목</th>
							<td class="text-center" width="40%">
								<div class="form-group">
                                     <input class="form-control" value="회식비" style="font-size: 15px">
                                </div>
							</td>
							<th width="10%" class="text-center" style="vertical-align: middle;">지급요청일</th>
							<td class="text-center" width="40%">
								<div class="form-group">
                                     <input class="form-control" value="XXXXX" style="font-size: 15px">
                                </div>
							</td>
						</tr>
						<tr>
							<th width="10%" class="text-center"  style="vertical-align: middle;">계좌번호(은행)</th>
							<td class="text-center" width="23%">
								<div class="form-group">
                                     <input class="form-control" value="1002-433-530480(은행)" style="font-size: 15px">
                                </div>
							</td>
							<th width="10%" class="text-center" style="vertical-align: middle;">예금주</th>
							<td>
								<div class="form-group">
                                     <input class="form-control" value="홍길동" style="font-size: 15px">
                                </div>
							</td>
						</tr>
						<tr>
							<th width="10%" class="text-center"  style="vertical-align: middle;">합계금액</th>
							<td class="text-center" width="23%">
								<div class="form-group">
                                     <input id="total_count" class="form-control" style="font-size: 15px" onblur="total();">
                                </div>
							</td>
							<th width="10%" class="text-center" style="vertical-align: middle;">지급조건</th>
							<td>
								<div class="form-group">
                                     <input class="form-control" value="계좌이체" style="font-size: 15px">
                                </div>
							</td>
						</tr>
                   		</table>
                   		<table width="100%" class="table table-striped table-bordered table-hover" id="approval_content">
                   			<tr>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">계정과목</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">지출일</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">지출내용</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">거래처</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">금액</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">결제수단</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">비고</th>
                   				<th width="10%" class="text-center"  style="vertical-align: middle;">증빙</th>
                   			</tr>
                   			<tr>
                   				<td class="text-center" >
								<div class="form-group">
                                   	<select class="form-control" style="font-size: 15px">
                                       	<option>1</option>
                                       	<option>2</option>
                                       	<option>3</option>
                                       	<option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
								</td>
								<td class="text-center">
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
								<td class="text-center" >
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
								<td class="text-center">
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
								<td class="text-center">
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
								<td class="text-center">
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
								<td class="text-center">
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
								<td class="text-center">
								<div class="form-group">
                                     <input class="form-control" style="font-size: 15px">
                                </div>
								</td>
                   			</tr>
                   		</table>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="col-lg-12" align="center">
		<button type="button" id="myButton" data-loading-text="추가중.." class="btn btn-primary" autocomplete="off" onclick="add()">
  			추가하기
		</button>
		<button type="button" id="myButton" data-loading-text="추가중.." class="btn btn-primary" autocomplete="off">
  			기안하기
		</button>
	</div>
</body>
</html>