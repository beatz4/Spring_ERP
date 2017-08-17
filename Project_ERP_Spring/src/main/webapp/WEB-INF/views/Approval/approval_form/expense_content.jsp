<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<tr>
	<td class="text-center">
		<div class="form-group">
			<select class="form-control" style="font-size: 15px" name="t_expense_idx">
				<c:forEach var="vo" items="${list }">
					<option value="${vo.t_expense_idx }">${vo.t_expense_title }</option>
				</c:forEach>
			</select>
		</div>
	</td>
	<td>
		<div class="form-group">
			<input name="c_expense_date" class="form-control" placeholder="선택하세요"
				style="font-size: 15px;">
		</div>
	</td>
	<td>
		<div class="form-group">
			<input class="form-control" style="font-size: 15px"
				name="c_expense_content">
		</div>
	</td>
	<td>
		<div class="form-group">
			<input class="form-control" style="font-size: 15px"
				name="c_expense_customer">
		</div>
	</td>
	<td>
		<div class="form-group">
			<input class="form-control" style="font-size: 15px"
				name="c_expense_money" numberOnly placeholder="0">
		</div>
	</td>
	<td>
		<div class="form-group">
			<input class="form-control" style="font-size: 15px"
				name="c_expense_mepay">
		</div>
	</td>
	<td>
		<div class="form-group">
			<input class="form-control" style="font-size: 15px"
				name="c_expense_et">
		</div>
	</td>
	<td>
		<div class="form-group">
			<input class="form-control" style="font-size: 15px"
				name="c_expense_proof">
		</div>
	</td>
	<td class="text-center" style="vertical-align: middle;"><i
		class="fa fa-times fa-fw"></i></td>
</tr>




