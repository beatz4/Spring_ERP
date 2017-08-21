<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<!-- zTree -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/css/zTreeStyle.css" rel="stylesheet" type="text/css">

<!-- Bootstrap Core CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- zTree -->
<link href="${ pageContext.request.contextPath }/resources/ExternalLib/zTree/css/zTreeStyle.css" rel="stylesheet" type="text/css">

<!-- 정규식 -->
<script src="${ pageContext.request.contextPath }/resources/regular/regular.js"></script>	

<!-- jQuery-Ajax를 사용하기위한 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>
		
			<div class="col-lg-12" align="center">
				<h1 class="page-header">조직 구성</h1>
			</div>
			<!-- /.col-lg-8 -->
		
		<!-- /.row -->
		 
		<!-- 좌측 트리 -->
		
			<div class="col-lg-6" align="center"> 
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
			</div>
			
			<!-- 우측 -->
			<div class="col-lg-6" align="center">
				<div class="panel panel-default">
					<div class="panel-heading">
						조직 구성원
					</div>
					<div class="panel-body">
						<!-- tree -->
						<ul id="treeMember" class="ztree"></ul>
						<!-- /.tree -->
					</div>
				</div>
			</div>
		
	<!-- /.container-fluid -->
	

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

	var menber_setting = {
		data: {
			simpleData: {
				enable: true
			}
		}
	};

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
		callback : {
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop,
			onClick : onClick
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
	
	
	
	function onClick(event, treeId, treeNode, clickFlag) {
		
		/* 조직 구성원 */
		var url = "c_user_line_list.do";

		$.ajax({
			url : url, //요청(서버)페이지
			data : {
				'name' : treeNode.name,
				'id' : treeNode.id
			},
			success : function(data) {
				
				var jsonTree = [];
				if( data === 'fail' ) {
					var empty = '[{ "id" : 1 , "pId" : 0, "name" : "구성원이 없습니다." }]';
					jsonTree = $.parseJSON(empty);
				} else {
					jsonTree = $.parseJSON(data);
				}
				
				$.fn.zTree.init($("#treeMember"), menber_setting, jsonTree);
				
				/* description - 추후 개선 */
//				$("#desc").html("설명");
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			}
		});
	}	
	
	
	$(document).ready(function() {
		
		/* 조직 구성도 */
		var url = "company_line_list.do";

		$.ajax({
			url : url, //요청(서버)페이지
			success : function(data) {

				// 이 데이터 형식을 반드시 유지해야한다.
				// var test = '[{ "id" : 1 , "pId" : 0, "name" : "pNode 1", "open" : "true" }]';

				var jsonTree = $.parseJSON(data);
				$.fn.zTree.init($("#tree"), setting, jsonTree);
				
				/* /* 각 element에 function binding */
				/* $("#addParent").bind("click", {isParent:true}, add);
				$("#addLeaf").bind("click", {isParent:false}, add);
				$("#edit").bind("click", edit);
				$("#remove").bind("click", remove); */

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