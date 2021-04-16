<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
	<head>
		<title>图书管理系统</title>
		<!-- 该 JSP 的当前路径 http://localhost:8080/library/ -->
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="static/css/ionicons.min.css">
		<link rel="stylesheet" type="text/css" href="static/css/AdminLTE.min.css">
		<link rel="stylesheet" type="text/css" href="static/css/skins/_all-skins.min.css">
		<script type="application/javascript" src="static/js/jquery-3.5.1.min.js"></script>
		<script type="application/javascript" src="static/jquery-ui/jquery-ui.min.js"></script>
		<script type="application/javascript" src="static/js/bootstrap.min.js"></script>
		<script type="application/javascript" src="static/js/adminlte.min.js"></script>
		<script type="application/javascript">
			function openFrame(titleIcon, titleText, parentIcon, parentText, url) {
				// 更改相应显示
				$("#titleIcon").attr("class", titleIcon);
				$("#titleText").text(titleText);
				$("#parentIcon").attr("class", parentIcon);
				$("#parentText").text(parentText);
				$("#childText").text(titleText);
				// 获得当前元素的高度
				var height = $("#content").parent("div").height() - 76;
				// 设定需要添加的 iframe 标签,将传入的 url设定src属性值中，即可达到嵌套页面效果
				var iframe = "<iframe src='" + url + "' style='width: 100%; height: " + height + "px; border: 0px solid #FFF;'></iframe>";
				// 向对应的 HTML 元素增加子节点
				$("#content").html(iframe);
			}

			// 打开首页面的模态框，将标题等参数传入
			function openModal(title, url, width, heigth) {
				// 将对应的 title 设定到相应的 HTML 上
				$("#myModalLabel").html(title);
				// 通过连接地址拼接 iframe 标签
				var iframe = "<iframe src='" + url + "' style='width: 100%; height: 100%; border: 0px solid #FFF;'></iframe>";
				// 设置宽度和高度
				$("#myModalBody").css("height", heigth + "px");
				$("#myModalDialog").css("width", width);
				$("#myModalBody").html(iframe);
				$("#myModal").modal();
			}
			// 关闭模态框
			function closeModal() {
				$("#myModal").modal("hide");
			}
		</script>
	</head>
	<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<a href="#" class="logo">
				<span class="logo-mini"><b>Libr</b></span>
				<span class="logo-lg"><b>Library</b></span>
			</a>
			<nav class="navbar navbar-static-top">
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
					<span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown messages-menu">
							<a href="#">
								<i class="fa fa-user-circle-o"></i>
								${sessionScope.user.name}
							</a>
						</li>
						<li class="dropdown messages-menu">
							<a href="user/logout">
								<i class="fa fa-sign-out"></i>
								退出
							</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="main-sidebar">
			<section class="sidebar">
				<div class="user-panel">
					<div class="pull-left image"></div>
					<div class="pull-left info">
						<p></p>
					</div>
				</div>
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header" style="font-size: 16px">图书信息管理功能栏</li>
					<c:forEach var="menu" items="${menuList}">
						<li class="treeview">
							<a href="${menu.url}">
								<i class="${menu.icon}"></i>
								<span>${menu.text}</span>
								<span class="pull-right-container">
			                                <i class="fa fa-angle-left pull-right"></i>
			                            </span>
							</a>
							<ul class="treeview-menu">
								<c:forEach var="child" items="${menu.children}">
									<li>
										<a href="javascript:openFrame('${child.icon}', '${child.text}', '${menu.icon}', '${menu.text}', '${child.url}');">
											<i class="${child.icon}"></i>
												${child.text}
										</a>
									</li>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</section>
		</aside>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					<i id="titleIcon" style="margin: 0px 10px"></i>
					<span id="titleText"><b>Library-</b>图书信息管理系统首页面</span>
				</h1>
				<ol class="breadcrumb">
					<li style="font-size: 16px">
						<a href="#">
							<i id="parentIcon"></i>
							<span id="parentText"></span>
						</a>
					</li>
					<li id="childText" class="active" style="margin: 0px 10px;font-size: 16px"></li>
				</ol>
			</section>
			<section id="content" class="content">

				<!-- 存放连接页面 -->
			</section>
		</div>
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.0.0
			</div>
			<strong>Copyright &copy; 2020-2021 <a href="http://www.slxy.cn">SLXY</a>.</strong> All rights
			reserved.
		</footer>
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="myModalDialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body" id="myModalBody"></div>
			</div>
		</div>
	</div>
	</body>
</html>
