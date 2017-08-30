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

</head>
<body>

	<!-- 메뉴 불러오기 -->
	<jsp:include page="../main/main_index.jsp"/>
	
	<!-- 본문 내용 -->
	<div id="page-wrapper" style="margin: 0;">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">자료실</h1>
			</div>
		</div>
		<div align="left" style="padding-bottom: 10px">
		  <button style="width: 80px;" type="button" class="btn" onclick="location.href='file_insert_form.do'">글쓰기</button>      
		</div>
		<div class="panel panel-default" style="margin: 0; min-width: 500px; min-height: 590px;">
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover" id="dataTables" style="text-align: center;">
					<thead>
						<tr>
					        <th width="3%" style="text-align: center;">번호</th>
					        <th width="78%" style="text-align: center;">제목</th>
					        <th width="5%" style="text-align: center;">작성자</th>
					        <th width="10%" style="text-align: center;">작성일자</th>
					        <th width="5%" style="text-align: center;">조회수</th>
						</tr>
					</thead>					
					<tbody>
						<c:if test="${ empty list }">
							<tr>
								<td colspan="5" align="center"><p style="color:balck;">게시글이 없습니다.<p></td>
							</tr>
						</c:if>
						<c:forEach var="vo" items="${ list }">
							<tr>
								<td>${ vo.idx }</td>
						        <td>${ vo.title }</td>
						        <td>${ vo.write_id }</td>
						      	<td>${ vo.write_date }</td>
						      	<td>${ vo.readhit }</td>
							</tr> 
						</c:forEach> 
					</tbody>
                 </table>
			</div>
		</div>
		<!-- 페이징 메뉴 -->
		<%-- <div align="center">${ pageHtml }</div> --%>
	</div>
</body>
</html>