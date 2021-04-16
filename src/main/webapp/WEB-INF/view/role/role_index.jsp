<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/AdminLTE.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/jquery.dataTables.min.css">
	<script type="application/javascript" src="../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../static/js/adminlte.min.js"></script>
	<script type="application/javascript" src="../static/js/jquery.dataTables.min.js"></script>
	<script type="application/javascript">
		// 1、异步发送page请求，获取数据
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
						// 扩展请求时候的数据，重点在于pageNo和pageSize
						var params = {
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
							// row 就是该行的数据对象
							var date = new Date(row.createTime);
							// 格式化时间
							var year = date.getFullYear();
							var month = date.getMonth() + 1;
							var day = date.getDate();
							return year + "年" + month + "月" + day + "日";
						}
					}, {
						targets: 3,
						data: function (row, type, val, meta) {
							var authBtn = "<a href='javascript:openAuthModal(\"" + row.id + "\");' class='btn btn-info btn-xs'><i class='fa fa-key'></i>&nbsp;授权</a>";
							var updateBtn = "<a href='' class='btn btn-warning btn-xs'><i class='fa fa-wrench'></i>&nbsp;修改</a>";
							var deteleBtn = "<a href='' class='btn btn-danger btn-xs'><i class='fa fa-remove'></i>&nbsp;删除</a>"
							return authBtn + "&nbsp;" + updateBtn + "&nbsp;" + deteleBtn;
						}
					}
				]
			});
		});
		// 2、角色授权：将 id 参数传入。
		function openAuthModal(id) {
			var title = "<i class='fa fa-key'></i>&nbsp;角色授权";
			// 嵌入 iframe 中的 url。id 参数不采用？挂在后面，直接写在路径后面
			var url = "role/auth/" + id;
			// 设定宽度和高度
			var width = 400;
			var heigth = 400;
			// 获得该页面的父页面对象，打开模态框
			parent.openModal(title, url, width, heigth);
		}
		// 3、添加新角色信息
		function openAddModal() {
			var title = "<i class='fa fa-plus'></i>&nbsp;新增角色信息";
			// 嵌入 iframe 中的 url
			var url = "role/save";
			// 设定宽度和高度
			var width = 800;
			var heigth = 300;
			// 获得该页面的父页面对象
			parent.openModal(title, url, width, heigth);
		}
	</script>
</head>
<body>
<div class="container" style="margin: 10px 5px;">
	<div class="row">
		<div class="col-md-12">
			<a href="javascript:openAddModal();" class="btn btn-success">
				<i class="fa fa-plus"></i>&nbsp;
				添加新角色
			</a>
		</div>
	</div>
	<div class="row" style="padding: 10px 0px;">
		<div class="col-md-12">
			<table id="myTable" class="table table-hover">
				<thead>
				<tr>
					<th>序号</th>
					<th>角色名称</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
</body>
</html>
