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
		<div class="row" style="padding-top: 20px;">
			<div class="col-lg-8">
				<h1 class="page-header">조직 구성</h1>
			</div>
			<!-- /.col-lg-8 -->
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
				<div class="panel panel-default">
					<div class="panel-heading">How to edit...</div>
					<div class="panel-body">
						부서 이동을 원하시면 드래그 하시면 됩니다. <br>
						부서 추가, 팀 추가는 폴더 아이콘을 선택하시고<br>
						기능을 수행하시기 바랍니다.<br>
						수정 후 반드시 저장하시기 바랍니다.<br>
					</div>
				</div>
			<!-- /.col-lg-3 -->
			</div>
			
			<!-- 우측 -->
			<div class="col-lg-5">
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
				<!-- 
				추후 추가
				<div class="panel panel-default">
					<div class="panel-heading">
						Description
					</div>
					<div class="panel-body">
						<span id="desc"></span>
					</div>
				</div>
				 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						조직 구성 수정
					</div>
					<div class="panel-body">
						
                        <div class="well">
                        	<!-- 부서 추가 button -->
                        	<a class="btn btn-default btn-lg" id="addParent" onclick="return false;">
                        		부서 추가
                       		</a>
                       		<!-- 팀 추가 button -->
                       		<a class="btn btn-default btn-lg" id="addLeaf" onclick="return false;">
                        		팀 추가
                       		</a>
                       		
                       		<!-- 소속명 수정 button -->
                       		<a class="btn btn-default btn-lg" id="edit" onclick="return false;">
                        		소속명 수정
                       		</a>
                       		
                       		<!-- 선택 삭제 -->
                        	<a class="btn btn-default btn-lg" id="remove" onclick="return false;">
                       			선택 삭제
                      		</a>
						</div>
					</div>
				</div>
			<!-- /.col-lg-5 -->
			</div>
		<!-- /.row -->
		</div>
		
		<div class="row">
			<div class="col-lg-8">
			
				<div class="panel panel-default">
					<div class="panel-body">
						<button type="button" class="btn btn-primary btn-lg btn-block" onclick="save();">
						 	저장
					 	</button>
					</div>
				</div>
			</div>
			
			<!-- /.col-lg-8 -->
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
			beforeRemove: beforeRemove,
			beforeRename: beforeRename,
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
	
	function beforeRemove(treeId, treeNode) {
		return confirm("삭제하면 복구가 불가능합니다.\r\n정말로 '" + treeNode.name + "' 를 삭제하시겠습니까?"); 
	}
	
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("공백은 지정할 수 없습니다.");
			var zTree = $.fn.zTree.getZTreeObj("tree");
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}
		return true;
	}
	
	function onClick(event, treeId, treeNode, clickFlag) {
		
		/* 조직 구성원 */
		var url = "c_user_list.do";

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
	
	var newCount = 1;
	function add(e) {
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		isParent = e.data.isParent,
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		
		count = treeNode.children==null ? 0 : treeNode.children.length;		// children length
		count += 1;
		
		// 자식 노드가 10개 이하일 경우 
		id = (count / 10 < 1) ? (treeNode.id * 100 + count) : (treeNode.id + '' + count);
		
		if (treeNode) {
			treeNode = zTree.addNodes(treeNode, {id:id, pId:treeNode.id, isParent:isParent, name:"new node" + (newCount++)});
		} else {
			treeNode = zTree.addNodes(null, {id:id, pId:0, isParent:isParent, name:"new node" + (newCount++)});
		}
		
		if (treeNode) {
			zTree.editName(treeNode[0]);
		} else {
			alert("부서를 선택 후 해당 기능을 수행해주세요.");
		}
	};
	
	/* 소속명 수정 */
	function edit() {
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("소속 부서 또는 팀을 먼저 선택 해주세요.");
			return;
		}

		zTree.editName(treeNode);
		
	};
	
	/* 선택 삭제 */
	function remove(e) {
		var zTree = $.fn.zTree.getZTreeObj("tree"),
		nodes = zTree.getSelectedNodes(),
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("부서를 먼저 선택해주세요.");
			return;
		}
		
		id = treeNode.id;
		var url = "company_delete.do";
		
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
	
	/* 저장 */
	function save() { 
		// tree element를 받아서 json데이터를 가져온다
		var zTree = $.fn.zTree.getZTreeObj("tree");
		var nodes = zTree.getNodes();
		var json = "{ \"root\" : " + JSON.stringify(nodes) + "}";
		
		var url = "company_save.do";

		$.ajax({
			type : "POST",
			url : url,
			data : {
				'json' : json	
			},
			success : function(data) {
				alert('저장되었습니다.');
			}
		});
 	}
	
	$(document).ready(function() {
		
		/* 조직 구성도 */
		var url = "company_list.do";

		$.ajax({
			url : url, //요청(서버)페이지
			success : function(data) {

				// 이 데이터 형식을 반드시 유지해야한다.
				// var test = '[{ "id" : 1 , "pId" : 0, "name" : "pNode 1", "open" : "true" }]';

				var jsonTree = $.parseJSON(data);
				$.fn.zTree.init($("#tree"), setting, jsonTree);
				
				/* 각 element에 function binding */
				$("#addParent").bind("click", {isParent:true}, add);
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