<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/user/info -->
	<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../static/css/AdminLTE.min.css">
	<script type="application/javascript" src="../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../static/js/adminlte.min.js"></script>
	<script type="application/javascript" src="../static/js/jquery.validate.min.js"></script>
	<script type="application/javascript">
		$(function () {
			$("#updateForm").validate({
				submitHandler: function(form){
					// 借助于该 submit 事件，实现表单的异步提交
					// 将对应表单中所有的数据进行提取，封装成数据以便于进行提交
					var formData = $("#updateForm").serialize();
					// 进行异步添加
					$.ajax({
						url: "update",
						type: "post",
						data: formData,
						dataType: "json",
						success: function (data) {
							if (data) {
								alert("修改成功！");
							} else {
								alert("修改失败！")
							}
							// // 关闭模态框
							// parent.closeModal();
							// 刷新页面
							window.location.reload();
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
				用户名：
			</td>
			<td>
				<input type="hidden" id="id" name="id" value="${user.id }"/>
				<input type="text" id="name" name="name" class="form-control"
				       value="${user.name}" style="width: 300px;"/>
			</td>
		</tr>
		<tr>
			<td>
				手机号码：
			</td>
			<td>
				<input type="text" id="cellphone" name="cellphone"
				       value="${user.cellphone}" class="form-control" style="width: 300px;" />
			</td>
		</tr>
		<tr>
			<td>
				身份证：
			</td>
			<td>
				<input type="text" id="idCard" name="idCard" class="form-control"
				       value="${user.idCard}" style="width: 300px;" placeholder="请填写出版社" disabled/>
			</td>
		</tr>
		<tr>
			<td>
				借阅数量：
			</td>
			<td>
				<input type="number" id="number" name="number" class="form-control"
				       min="1" max="1000" step="1" value="${user.number}" disabled/>
			</td>
		</tr>

		<tr>
			<td>
				账户余额：
			</td>
			<td>
				<input type="number" id="money" name="money" class="form-control"
				       min="1" max="1000" step="1" value="${user.money}"/>
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
