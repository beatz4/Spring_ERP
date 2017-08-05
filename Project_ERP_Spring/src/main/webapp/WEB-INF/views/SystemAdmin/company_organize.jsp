<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조직 구성</title>

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
			<div class="col-lg-7">
				<h1 class="page-header">조직 구성</h1>
			</div>
			<!-- /.col-lg-7 -->
		</div>
		<!-- /.row -->
		<div class="row"> 
			<!-- 좌측 트리 -->
			<div class="col-lg-3"> 
				<div class="panel panel-default">
					<div class="panel-heading">
						조직구성도 
					</div>
					<div class="panel-body">
						<!-- tree -->
						<ul id="tree" class="ztree"></ul>
						<!-- /.tree -->
						
					</div>
				</div> 
			<!-- /.col-lg-3 -->
			</div>
			
			<!-- 우측 -->
			<div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">Description</div>
					<div class="panel-body">부서 이동을 원하시면 드래그 하시면 됩니다.</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						조직 구성 수정
					</div>
					<div class="panel-body">
						
                        <div class="well">
                        	<!-- 부서 추가 button -->
                        	<a class="btn btn-default btn-lg" onclick="add_department();">
                        		부서 추가
                       		</a>
                       		<!-- 팀 추가 button -->
                       		<a class="btn btn-default btn-lg" onclick="add_team();">
                        		팀 추가
                       		</a>
                       		
                       		<!-- 선택 삭제 -->
                        	<a class="btn btn-default btn-lg" onclick="delete_sel()">
                       			선택 삭제
                      		</a>
						</div>
					</div>
				</div>
			<!-- /.col-lg-4 -->
			</div>
		<!-- /.row -->
		</div>
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

<script type="text/javascript">

	var setting = {
		edit: {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback : {
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop
		}
	};

	function beforeDrag(treeId, treeNodes) {
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}
	
	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
		return targetNode ? targetNode.drop !== false : true;
	}

	$(document).ready(function() {
		
				var url = "company_list.do";

				$.ajax({
					url : url, //요청(서버)페이지
					success : function(data) {

						// 이 데이터 형식을 반드시 유지해야한다.
						// var test = '[{ "id" : 1 , "pId" : 0, "name" : "pNode 1", "open" : "true" }]';

						var jsonTree = $.parseJSON(data);
						$.fn.zTree.init($("#tree"), setting, jsonTree);

					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
			});
	
	/* 부서 추가 */
	function add_department() {
		alert('부서 추가');
	}
	
	/* 팀 추가 */
	function add_team() {
		alert('팀 추가');
	}
	
	/* 선택 삭제 */
	function delete_sel() {
		alert('선택 삭제');
	}
</script>

</body>
</html>