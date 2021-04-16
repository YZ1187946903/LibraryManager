<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/role/auth/1 -->
	<link rel="stylesheet" type="text/css" href="../../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/ztree/css/zTreeStyle/zTreeStyle.css">
	<script type="application/javascript" src="../../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../../static/ztree/js/jquery.ztree.all.min.js"></script>
	<script type="application/javascript">
		var setting = {
			view: {
				selectedMulti: false
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onCheck: onCheck
			}
		};

		var clearFlag = false;
		function onCheck(e, treeId, treeNode) {
			count();
			if (clearFlag) {
				clearCheckedOldNodes();
			}
		}
		function clearCheckedOldNodes() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
				nodes = zTree.getChangeCheckedNodes();
			for (var i=0, l=nodes.length; i<l; i++) {
				nodes[i].checkedOld = nodes[i].checked;
			}
		}
		function count() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
				checkCount = zTree.getCheckedNodes(true).length,
				nocheckCount = zTree.getCheckedNodes(false).length,
				changeCount = zTree.getChangeCheckedNodes().length;
			$("#checkCount").text(checkCount);
			$("#nocheckCount").text(nocheckCount);
			$("#changeCount").text(changeCount);

		}

		$(document).ready(function(){
			// 1、异步查询该角色的菜单集合
			$.ajax({
				// ****发送 menu/nodelist 请求异步获取菜单信息****
				url: "../../menu/nodelist",
				type: "post",
				data: {
					"roleId": $("#id").val()
				},
				dataType: "json",
				success: function (data) {
					// 创建节点树
					$.fn.zTree.init($("#treeDemo"), setting, data);
				}
			});
		});
		// 2、鼠标点击授权：
		function auth() {
			// 获取用户已经选择的功能菜单 id
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			// 获得对应的 ztree 对象后，获得该对象的主键
			var checkedNodes = zTree.getCheckedNodes(true);
			// 循环遍历节点，获得主键
			var checkIds = "";
			if (checkedNodes.length == 0) {
				alert("请选择该角色的权限");
				return;
			}
			for (var i = 0; i < checkedNodes.length; i++) {
				var id = checkedNodes[i].id;
				checkIds = checkIds + "-" + id;
			}
			// 去掉多余的 "-"
			checkIds = checkIds.substring(1, checkIds.length);
			// 异步授权
			$.ajax({
				type: "post",
				data: {
					"checkedIds": checkIds
				},
				dataType: "json",
				success: function (data) {
					if (data) {
						alert("授权成功");
					} else {
						alert("授权失败");
					}
					// 关闭模态框
					parent.closeModal();
					// 刷新页面
					parent.openFrame("fa fa-key", "角色管理", "fa fa-dashboard", "系统管理", "role/index");
				}
			});
		}
	</script>
</head>
<body>
<%--    隐藏域：用于传送 id值--%>
<input type="hidden" id="id" value="${id}"/>
<div class="zTreeDemoBackground left">
	<ul id="treeDemo" class="ztree"></ul>
</div>
<div>
	<button type="button" onclick="auth()" class="btn btn-success">
		<i class="fa fa-key"></i>&nbsp;
		授权
	</button>
</div>
</body>
</html>
