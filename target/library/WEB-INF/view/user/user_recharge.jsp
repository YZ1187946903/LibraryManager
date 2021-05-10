<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/user/charge -->
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
					// 进行异步修改
					$.ajax({
						url: "recharge",
						type: "post",
						data: formData,
						dataType: "json",
						success: function (data) {
							if (data) {
								alert("充值成功！");
							} else {
								alert("充值失败")
							}
							// 刷新页面
							window.location.reload();
							// parent.openFrame("fa fa-wrench", "修改密码", "fa fa-user-circle", "我的信息", "user/password");
						}
					});
				},
			});
		});
	</script>
</head>
<body>
<form id="Form" role="form">
	<table style="border-collapse: separate; border-spacing: 5px;margin: 10px;">
		<tr>
			<td style="text-align: right;">
				<i class="fa fa-rmb"></i>&nbsp;
				充值金额：
			</td>
			<td>
				<input type="hidden" name="id" value="${user.id }"/>
				<input type="number" id="money" name="money" class="form-control" style="width: 300px;" placeholder="请填写要充值的金额"
				       min="1" max="1000" step="1"/>
			</td>
			<td>
				<label class="error" for="money" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;">
				<button type="submit" class="btn btn-success">
					<i class="fa fa-wrench"></i>&nbsp;
					充值
				</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
