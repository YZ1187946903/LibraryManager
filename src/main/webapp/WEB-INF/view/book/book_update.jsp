<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/book/update/id -->
	<link rel="stylesheet" type="text/css" href="../../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/css/AdminLTE.min.css">
	<script type="application/javascript" src="../../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../../static/js/adminlte.min.js"></script>
	<script type="application/javascript" src="../../static/js/jquery.validate.min.js"></script>
	<script type="application/javascript">
		$(function () {
			$("#updateForm").validate({
				submitHandler: function(form){
					// 借助于该 submit 事件，实现表单的异步提交
					// 将对应表单中所有的数据进行提取，封装成数据以便于进行提交
					var formData = $("#updateForm").serialize();
					// 进行异步添加
					$.ajax({
						url: "../update",
						type: "post",
						data: formData,
						dataType: "json",
						success: function (data) {
							if (data) {
								alert("修改成功！");
							} else {
								alert("修改失败！")
							}
							// 关闭模态框
							parent.closeModal();
							// 刷新页面
							parent.openFrame("fa fa-book", "图书信息", "fa fa-cog", "系统管理", "book/list");
						}
					});
				}
			});
		});
	</script>
</head>
<body>
<form id="updateForm" role="form">
	<table style="border-collapse: separate; border-spacing: 5px;">
		<tr>
			<td>
				书籍名称：
			</td>
			<td>
				<input type="hidden" id="id" name="id" value="${book.id }"/>
				<input type="text" id="name" name="name" class="form-control"
				       value="${book.name}" style="width: 300px;" placeholder="请填写图书名称"/>
			</td>
		</tr>
		<tr>
			<td>
				书籍编号：
			</td>
			<td>
				<input type="text" id="no" name="no"
				       value="${book.no}" class="form-control" style="width: 300px;" placeholder="请填写图书编号"/>
			</td>
		</tr>
		<tr>
			<td>
				作者：
			</td>
			<td>
				<input type="text" id="author" name="author"
				       value="${book.author}" class="form-control" style="width: 300px;" placeholder="请填写作者"/>
			</td>
		</tr>
		<tr>
			<td>
				出版社：
			</td>
			<td>
				<input type="text" id="publish" name="publish" class="form-control"
				       value="${book.publish}" style="width: 300px;" placeholder="请填写出版社"/>
			</td>
		</tr>
		<tr>
			<td>
				价格：
			</td>
			<td>
				<input type="number" id="price" name="price" class="form-control"
				       min="1" max="1000" step="1" value="${book.price}"/>
			</td>
		</tr>

		<tr>
			<td>
				库存数量：
			</td>
			<td>
				<input type="number" id="number" name="number" class="form-control"
				       min="1" max="1000" step="1" value="${book.number}"/>
			</td>
		</tr>

		<tr>
			<td>
				存放区域：
			</td>
			<td>
				<select id="bookshelf" name="bookshelf" value="${book.bookshelf}" class="form-control">
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
			<td colspan="2" style="text-align: right;">
				<button type="submit" class="btn btn-success" style="margin: 20px">
					<i class="fa fa-wrench"></i>&nbsp;
					修改
				</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
