<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/bookLog/delete -->
	<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/AdminLTE.min.css">
	<script type="application/javascript" src="../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../static/js/adminlte.min.js"></script>
	<script type="application/javascript" src="../static/js/jquery.validate.min.js"></script>
	<script type="application/javascript">
		$(function () {
			$("#Form").validate({
				submitHandler: function(form){
					// 借助于该 submit 事件，实现表单的异步提交
					// 将对应表单中所有的数据进行提取，封装成数据以便于进行提交
					var formData = $("#Form").serialize();
					// 进行异步添加
					$.ajax({
						url: "delete",
						type: "post",
						data: formData,
						dataType: "json",
						success: function (data) {
							if (data) {
								alert("出库成功！");
							} else {
								alert("出库失败！")
							}
							// 关闭模态框
							parent.closeModal();
							// 刷新页面
							parent.openFrame("fa fa-window-minimize", "图书出库记录", "fa fa-gears", "图书管理", "bookLog/out");
						}
					});
				}
			});
		});
	</script>
</head>
<body>
<form id="Form" role="form">
	<table style="border-collapse: separate; border-spacing: 5px;">
		<tr>
			<td>
				书籍名称：
			</td>
			<td>
				<input type="hidden"  name="operator" value="${user.name }"/>
				<input type="text" id="name" name="name" class="form-control"
				       style="width: 300px;" placeholder="请填写图书名称"/>
			</td>
		</tr>
		<tr>
			<td>
				书籍编号：
			</td>
			<td>
				<input type="text" id="no" name="no"
				       class="form-control" style="width: 300px;" placeholder="请填写图书编号"/>
			</td>
		</tr>
		<tr>
			<td>
				作者：
			</td>
			<td>
				<input type="text" id="author" name="author"
				       class="form-control" style="width: 300px;" placeholder="请填写作者"/>
			</td>
		</tr>
		<tr>
			<td>
				出版社：
			</td>
			<td>
				<input type="text" id="publish" name="publish" class="form-control"
				       style="width: 300px;" placeholder="请填写出版社"/>
			</td>
		</tr>
		<tr>
			<td>
				价格：
			</td>
			<td>
				<input type="number" id="price" name="price" class="form-control"
				       min="1" max="1000" step="1" placeholder="请选择图书价格"/>
			</td>
		</tr>

		<tr>
			<td>
				库存数量：
			</td>
			<td>
				<input type="number" id="number" name="number" class="form-control"
				       min="1" max="1000" step="1" placeholder="请选择出库数量"/>
			</td>
		</tr>

		<tr>
			<td>
				存放区域：
			</td>
			<td>
				<select id="bookshelf" name="bookshelf" class="form-control">
					<option>A区</option>
					<option>B区</option>
					<option>C区</option>
					<option>D区</option>
					<option>E区</option>
					<option>F区</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				出库去向：
			</td>
			<td>
				<input type="text" id="place" name="place"
				       class="form-control" style="width: 300px;" placeholder="请填写出库去向"/>
			</td>
		</tr>

		<tr>
			<td colspan="2" style="text-align: right;">
				<button type="submit" class="btn btn-success" style="margin: 20px">
					<i class="fa fa-wrench"></i>&nbsp;
					出库
				</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
