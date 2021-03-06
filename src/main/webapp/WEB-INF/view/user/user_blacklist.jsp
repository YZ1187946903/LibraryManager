<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/user/blacklist -->
	<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/AdminLTE.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/jquery.dataTables.min.css">
	<script type="application/javascript" src="../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../static/js/adminlte.min.js"></script>
	<script type="application/javascript" src="../static/js/jquery.dataTables.min.js"></script>
	<script type="application/javascript">
		$(function () {
			$("#myTable").DataTable({
				// 语言切换成中文
				language: {
					url: "../static/i18n/datatables-zh.json"
				},
				// 关闭搜索框
				searching: false,
				// 关闭排序
				ordering: false,
				// 设定表格的数据是通过异步方式获得
				serverSide: true,
				ajax: {
					// 请求地址
					url: "page",
					// 请求方式
					type: "post",
					// 设定在请求列表的时候，所需要携带的请求参数
					data: function(d) {
						// 获得对应的设置信息
						var tableSetings = $("#myTable").dataTable().fnSettings();
						// 删除多余请求参数
						for(var key in d) {
							if(key.indexOf("columns")==0||key.indexOf("order")==0||key.indexOf("search")==0){
								//以columns开头的参数删除
								delete d[key];
							}
						}

						// 获得开始的下标
						var start = parseInt(tableSetings._iDisplayStart);
						// 获得每页显示数量
						var size = parseInt(tableSetings._iDisplayLength);
						// 根据开始的下标和每页显示数量获得页码
						var pageNo = start / size + 1;
						var pageSize = size;
						// 扩展请求时候的数据，重点在于pageNum和pageSize
						var params = {
							"status": 0,
							// 获得表格对象后，
							"pageNo": pageNo,
							// 每页显示数量
							"pageSize": pageSize
						}
						// 将新增的查询数据扩展到请求参数上
						$.extend(d, params); //给d扩展参数
					},
					// 设定回传的数据格式为JSON
					dataType: "json",
					// 过滤数据
					dataFilter: function(data) {
						data = JSON.parse(data);
						var returnData = {};
						returnData.draw = data.draw;
						returnData.recordsTotal = data.totalCount;
						returnData.recordsFiltered = data.totalCount;
						returnData.data = data.list;
						return JSON.stringify(returnData);
					}
				},
				// 根据查询结果定义每个字段的信息
				columnDefs: [
					{
						targets: 0,
						data: function (row, type, val, meta) {
							// 在序号位置
							var tableSetings = $("#myTable").dataTable().fnSettings();
							// 当前页开始开始下标，从 0 开始
							var start = parseInt(tableSetings._iDisplayStart);
							// 每页显示数量
							var size = parseInt(tableSetings._iDisplayLength);
							// 根据开始下标和每页显示数量计算当前页
							var page = start / size + 1;
							// 获得当前条目下标
							var index = parseInt(meta.row);
							return (page - 1) * size + index + 1;
						}
					}, {
						targets: 1,
						data: function (row, type, val, meta) {
							// 用户姓名
							// row 就是该行的数据对象
							return row.name;
						}
					}, {
						targets: 2,
						data: function (row, type, val, meta) {
							// 手机号码
							return row.cellphone;
						}
					}, {
						targets: 3,
						data: function (row, type, val, meta) {
							// 用户角色
							return row.role.name;
						}
					}, {
						targets: 4,
						data: function (row, type, val, meta) {
							// 身份证号码
							return row.idCard;
						}
					},{
						targets: 5,
						data: function (row, type, val, meta) {
							// 系统状态
							if (row.status == 0) {
								return "禁用";
							} else if (row.status == 1) {
								return "启用"
							} else if (row.status == 2) {
								return "未审核"
							} else {
								return "注销"
							}
						}
					},{
						targets: 6,
						data: function (row, type, val, meta) {
							return row.number+"本"
						}
					},{
						targets: 7,
						data: function (row, type, val, meta) {
							return row.money+"元"
						}
					}, {
						targets: 8,
						data: function (row, type, val, meta) {
							// 操作按钮
							var updateBtn = "<a href='javascript:removeBlack(\"" + row.id + "\");' class='btn btn-warning btn-xs'><i class='fa fa-wrench'></i>&nbsp;移除黑名单</a>";
							return updateBtn
						}
					}
				]
			});
		});

		function removeBlack(id) {
			$.ajax({
				// 1、设定所发送 HTTP 请求的 URL 地址
				url: "update",
				// 2、设定所发送 HTTP 请求的方式
				type: "post",
				// 3、如果需要携带请求参数，则使用 data 属性
				data: {
					"status": 1,
					"id":id
				},
				dataType: "json",
				success: function(data) {
					if (data) {
						alert("移除成功");
					} else {
						alert("移除失败");
					}
					window.location.reload();
				}
			});
		}
	</script>
</head>
<body>
<div class="container" style="margin: 10px 5px;">
	<div class="row" style="padding: 10px 0px;">
		<%--    pull-12:左右间距小一点--%>
		<div class="col-md-pull-12">
			<table id="myTable" class="table table-hover">
				<thead>
				<tr>
					<th>序号</th>
					<th>用户姓名</th>
					<th>手机号码</th>
					<th>用户角色</th>
					<th>身份证号码</th>
					<th>系统状态</th>
					<th>借阅数量</th>
					<th>账户余额</th>
					<th>操作</th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
</body>
</html>
