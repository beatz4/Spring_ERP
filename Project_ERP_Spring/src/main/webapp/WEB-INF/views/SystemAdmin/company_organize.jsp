<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조직 구성</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/ExternalLib/zTree/css/zTreeStyle.css" type="text/css">

</head>
<body>

<!-- 주 메뉴 -->
<jsp:include page="../main/main_index.jsp" />

<!-- 사용자 정보, 서브 메뉴 -->
<jsp:include page="../main/side_menu.jsp" />

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">조직 구성</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row"> 
			<!-- 좌측 트리 -->
			<div class="col-lg-3"> 
				<div class="panel panel-default">
					<div class="panel-body">
					
						<!-- tree -->
						
							<ul id="treeDemo" class="ztree"></ul>
						 
						<!-- /.tree -->
					</div>
				</div>
			<!-- /.col-lg-3 -->
			</div>
			
			<!-- 우측 -->
			<div class="col-lg-9"> 
				<div class="panel panel-default">
					<div class="panel-body">
						
                        <div class="well">
                        	<!-- 사용자 추가 button -->
                        	<a class="btn btn-default btn-lg" href="register_form.do">사용자 추가</a>
                        	<a class="btn btn-default btn-lg" target="_blank" 
                        		href="javascript:void(0);"
                        		onclick="del_user()">
                        			사용자 삭제
                      		</a>
						</div>
					</div>
				</div>
			<!-- /.col-lg-9 -->
			</div>
		<!-- /.row -->
		</div>
	<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->

 <!-- jQuery --> 
<script
	src="${ pageContext.request.contextPath }/ExternalLib/bootstrap/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="${ pageContext.request.contextPath }/ExternalLib/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script
	src="${ pageContext.request.contextPath }/ExternalLib/bootstrap/js/metisMenu.min.js"></script>
	
<!-- Custom Theme JavaScript -->
<script
	src="${ pageContext.request.contextPath }/ExternalLib/bootstrap/js/sb-admin-2.js"></script>

<!-- zTree JavaScript -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/ExternalLib/zTree/js/jquery.ztree.core.js"></script>

<script type="text/javascript">
	 
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	
	/* json형식 데이터를 servlet에서 받아와야한다. */
	var zNodes =[
		{ id:1, pId:0, name:"pNode 1", open:true},
		{ id:11, pId:1, name:"pNode 11"},
		{ id:111, pId:11, name:"leaf node 111"},
		{ id:112, pId:11, name:"leaf node 112"},
		{ id:113, pId:11, name:"leaf node 113"},
		{ id:114, pId:11, name:"leaf node 114"},
		{ id:12, pId:1, name:"pNode 12"},
		{ id:121, pId:12, name:"leaf node 121"},
		{ id:122, pId:12, name:"leaf node 122"},
		{ id:123, pId:12, name:"leaf node 123"},
		{ id:124, pId:12, name:"leaf node 124"},
		{ id:13, pId:1, name:"pNode 13 - no child", isParent:true},
		{ id:2, pId:0, name:"pNode 2"},
		{ id:21, pId:2, name:"pNode 21", open:true},
		{ id:211, pId:21, name:"leaf node 211"},
		{ id:212, pId:21, name:"leaf node 212"},
		{ id:213, pId:21, name:"leaf node 213"},
		{ id:214, pId:21, name:"leaf node 214"},
		{ id:22, pId:2, name:"pNode 22"},
		{ id:221, pId:22, name:"leaf node 221"},
		{ id:222, pId:22, name:"leaf node 222"},
		{ id:223, pId:22, name:"leaf node 223"},
		{ id:224, pId:22, name:"leaf node 224"},
		{ id:23, pId:2, name:"pNode 23"},
		{ id:231, pId:23, name:"leaf node 231"},
		{ id:232, pId:23, name:"leaf node 232"},
		{ id:233, pId:23, name:"leaf node 233"},
		{ id:234, pId:23, name:"leaf node 234"},
		{ id:3, pId:0, name:"pNode 3 - no child", isParent:true}
	];
	
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</script>

</body>
</html>