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
					// 进行异步修改
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
							parent.openFrame("fa fa-book", "图书权限", "fa fa-cog", "系统管理", "book/power");
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
				借读状态：
			</td>
			<td>
				<input type="radio" name="status" value="0" >不可借阅
				<input type="radio" name="status" value="1" checked>可借阅
				<input type="hidden" name="id" value="${id}">
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
