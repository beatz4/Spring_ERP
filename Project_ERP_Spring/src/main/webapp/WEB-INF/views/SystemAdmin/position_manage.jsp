<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직책 관리</title>

<!-- zTree -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/css/zTreeStyle.css" rel="stylesheet" type="text/css">

</head>
<body>

	<!-- 주 메뉴 -->
	<jsp:include page="../main/main_index.jsp" />

	<!-- 사용자 정보, 서브 메뉴 -->
	<jsp:include page="../main/side_menu.jsp" />

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">직책 목록</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<!-- 좌측 트리 -->
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						직책 구성도 
					</div>
					<div class="panel-body">
						<!-- tree -->
						<ul id="tree" class="ztree"></ul>
						<!-- /.tree -->
					</div>
				</div>
			</div>
			
			<!-- 우측 상세 -->
			<div class="col-lg-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						상세 정보
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<tr>
									<th>일련 번호</th>
									<th>직책명</th>
									<th>보안 등급</th>
							 	</tr>
							 	<tr>
									<td>
										<input id="g_idx" type="text" readonly="readonly">
									</td>
							 		<td>
							 			<input id="g_position" type="text" readonly="readonly">
						 			</td>
							 		<td>
							 			<select id="g_level" disabled="disabled">
							 				<option value="1">1</option>
							 				<option value="2">2</option>
							 				<option value="3">3</option>
							 				<option value="4">4</option>
							 				<option value="5">5</option>
							 				<option value="6">6</option>
							 				<option value="7">7</option>
							 				<option value="8">8</option>
							 				<option value="9">9</option>
							 				<option value="10">10</option>
							 			</select>
							 			<!-- <input id="g_level" type="text" readonly="readonly"> -->
						 			</td>
							 	</tr>
							</table> 
							<input class="btn btn-primary btn-lg btn-block" id="confirm" type="hidden" value="확인">
							<input class="btn btn-primary btn-lg btn-block" id="cancel" type="hidden" value="취소">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
		
		<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							Control Panel
						</div>
						<div class="panel-body">
							<div class="well">
								<!-- 직책 추가 button -->
		                       	<a class="btn btn-default btn-lg" id="addLeaf">직책 추가</a>
		                       	<a class="btn btn-default btn-lg" id="edit">직책 수정</a>
		                       	<a class="btn btn-default btn-lg" id="remove">선택 직책 삭제</a>
	                   		</div>
						</div>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
	
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
	
<!-- zTree JavaScript -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/js/jquery.ztree.exedit.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/js/jquery.ztree.excheck.js"></script>
	
<script type="text/javascript">
	/* tree */
	var setting = {

			view: {
				selectedMulti: false
			},
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data: {
				keep: {
					parent:true,
					leaf:true
				},
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onClick : onClick,
				onRename : onRename
			}
		};
	
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	
	function beforeRemove(treeId, treeNode) {
		return confirm("삭제하면 복구가 불가능합니다.\r\n정말로 '" + treeNode.name + "' 를 삭제하시겠습니까?"); 
	}
	
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("Node name can not be empty.");
			var zTree = $.fn.zTree.getZTreeObj("tree");
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}
		return true;
	}
	
	var newCount = 1;
	
	function add(e) {
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		
		var allnodes = zTree.getNodes();
		
		treeNode = zTree.addNodes(null, {id:(100 + newCount), pId:0, name:"new node" + (newCount++)});
		zTree.editName(treeNode[0]);
		
		// 컨트롤 입력
		$("#g_idx").val(allnodes.length);
		$("#g_level").attr("disabled",false);
		
		$("#confirm").attr("type","button");
		$("#cancel").attr("type","button");
		
		$("#confirm").bind("click", confirm_pos);
		$("#cancel").bind("click", cancel_pos);
	};
	
	function confirm_pos() {
		
		$("#g_idx").attr("readonly",true);
		$("#g_position").attr("readonly",true);
		$("#g_level").attr("readonly",true);
		
		$("#confirm").attr("type","hidden");
		$("#cancel").attr("type","hidden");
		
		// insert ajax
		url = "insert_position.do";
		
		var g_idx = $("#g_idx").val();
		var g_position = $("#g_position").val();
		var g_level = $("#g_level").val();
		
		$.ajax({
			url : url,  //요청(서버)페이지
			data : {
				'g_idx' : g_idx,
				'g_position' : g_position,
				'g_level' : g_level
			},
			success : function(data) {
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			}
		});
	};
	
	function cancel_pos() {
		$("#g_idx").attr("readonly",true);
		$("#g_position").attr("readonly",true);
		$("#g_level").attr("readonly",true);
		
		$("#confirm").attr("type","hidden");
		$("#cancel").attr("type","hidden");
		
		// 새로고침
		location.reload();
	};
	
	function onRename(event, treeId, treeNode, isCancel) {
		$("#g_position").val(treeNode.name);
	}
	
	function edit() {
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("공백은 불가능 합니다.");
			return;
		}
		zTree.editName(treeNode);
	};
	
	function remove(e) {
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("직책을 먼저 선택해주세요.");
			return;
		}
		
		id = treeNode.id;
		var url = "position_delete.do";
		
		$.ajax({
			type : "POST",
			url : url,
			data : {
				'id' : id	
			},
			success : function(data) { 
				// alert(data + '이(가) 삭제되었습니다');
			}
		});
		
		zTree.removeNode(treeNode, true);
	};
	
	function onClick(event, treeId, treeNode, clickFlag) {
		
		var url = "position_select.do";
		
		$.ajax({
			url : url,  //요청(서버)페이지
			data : {
				'name' : treeNode.name
			},
			success : function(data) {
				var obj = eval("("+data+")");
				  
				$("#g_idx").val(obj.g_idx);
				$("#g_position").val(obj.g_position);
				$("#g_level").val(obj.g_level);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			}
		});
	}
	
	$(document).ready(function(){
		
		var url = "position_list.do";
		
		$.ajax({
			url : url, //요청(서버)페이지
			success : function(data) {
				
				// json 데이터로 받아온다
				var jsonTree = $.parseJSON(data);
				$.fn.zTree.init($("#tree"), setting, jsonTree);
				
				$("#addLeaf").bind("click", {isParent:false}, add);
				$("#edit").bind("click", edit);
				$("#remove").bind("click", remove);
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			}
		});
	});

</script>

</body>
</html>