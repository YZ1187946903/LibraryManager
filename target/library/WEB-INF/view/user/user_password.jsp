<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/user/password -->
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
						url: "password",
						type: "post",
						data: formData,
						dataType: "json",
						success: function (data) {
							if (data) {
								alert("修改成功，请重新登录！");
								// 修改成功，跳转页面执行用户退出登录
								parent.location.href = "http://localhost:8081/library/user/logout";
							} else {
								alert("修改失败")
							}
							// 刷新页面
							parent.openFrame("fa fa-wrench", "修改密码", "fa fa-user-circle", "我的信息", "user/password");
						}
					});
				},
				// 对于表单校验方式
				rules: {
					"oldPassword": {
						// 校验规则
						required: true,
						rangelength: [6, 20],
					},
					"password": {
						// 校验规则
						required: true,
						rangelength: [6, 20],
					},
					"confirmPassword": {
						// 校验规则
						required: true,
						rangelength: [6, 20],
						// *****异步校验确认密码是否正确*****
						remote: {
							url: "confirmPassword",
							type: "post",
							dataType: "json",
							data: {
								"confirmPassword": function () {
									return $("#confirmPassword").val();
								},
								"password": function () {
									return $("#password").val();
								}
							}
						}
					}
				},
				// 表单校验错误时的提示信息
				messages: {
					"oldPassword":{
						required: "请填写密码",
						rangelength: "密码长度在6个长度到20长度之间",
					},
					"password": {
						// 校验规则
						required: "请填写新密码",
						rangelength: "密码长度在6个长度到20长度之间",
					},
					"confirmPassword":{
						required: "请二次确认密码",
						rangelength: "密码长度在6个长度到20长度之间",
						remote: "两次输入密码不一致！"
					}
				}
			});
		});
	</script>
</head>
<body>
<form id="Form" role="form">
	<table style="border-collapse: separate; border-spacing: 5px;margin: 10px;">
		<tr>
			<td style="text-align: right;">
				<i class="fa fa-key"></i>&nbsp;
				原密码：
			</td>
			<td>
				<input type="hidden" name="id" value="${user.id }"/>
				<input type="password" id="oldPassword" name="oldPassword" class="form-control" style="width: 300px;" placeholder="请填写您原来的密码"/>
			</td>
			<td>
				<label class="error" for="oldPassword" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
				<i class="fa fa-key"></i>&nbsp;
				新密码：
			</td>
			<td>
				<input type="password" id="password" name="password" class="form-control" style="width: 300px;" placeholder="请填写您的新密码"/>
			</td>
			<td>
				<label class="error" for="password" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">
				<i class="fa fa-key"></i>&nbsp;
				请再次确认密码：
			</td>
			<td>
				<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" style="width: 300px;" placeholder="请再次确认您的密码"/>
			</td>
			<td>
				<label class="error" for="confirmPassword" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;">
				<button type="submit" class="btn btn-success">
					<i class="fa fa-wrench"></i>&nbsp;
					修改
				</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
