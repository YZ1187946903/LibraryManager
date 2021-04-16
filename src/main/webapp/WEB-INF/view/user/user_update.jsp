<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/user/update/id -->
	<link rel="stylesheet" type="text/css" href="../../static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../../static/css/AdminLTE.min.css">
	<script type="application/javascript" src="../../static/js/jquery-3.5.1.min.js"></script>
	<script type="application/javascript" src="../../static/js/bootstrap.min.js"></script>
	<script type="application/javascript" src="../../static/js/adminlte.min.js"></script>
	<script type="application/javascript" src="../../static/js/jquery.validate.min.js"></script>
	<script type="application/javascript">
		$(function () {
			$("#form").validate({
				submitHandler: function(form){
					// 借助于该 submit 事件，实现表单的异步提交
					// 将对应表单中所有的数据进行提取，封装成数据以便于进行提交
					var formData = $("#form").serialize();
					// 进行异步添加
					$.ajax({
						url: "../update",
						type: "post",
						data: formData,
						dataType: "json",
						success: function (data) {
							if (data) {
								alert("修改成功");
							} else {
								alert("修改失败");
							}
							// 关闭模态框
							parent.closeModal();
							// 刷新页面
							parent.openFrame("fa fa-address-book", "用户信息", "fa fa-users", "用户管理", "user/list");
						}
					});
				},
				// 对于表单校验方式
				rules: {
					"cellphone": {
						// 校验规则
						required: true,
						rangelength: [11,11],
						// *****异步校验手机号码是否重复*****
						remote: {
							url: "../check/cellphone",
							type: "post",
							dataType: "json",
							// 异步传输给后端的数据
							data: {
								"cellphone": function () {
									return $("#cellphone").val();
								},
								"id": function () {
									return $("#id").val();
								}
							}
						}
					},
					"idCard":{
						rangelength: [18,18]
					},
				},
				// 表单校验错误时的提示信息
				messages: {
					"cellphone": {
						// 校验规则
						required: "请填写手机号码",
						rangelength: "手机格式不正确",
						remote: "该手机号码已被使用"
					},
					"idCard":{
						rangelength: "身份证格式错误"
					}
				}
			});
		});
	</script>
	<style type="text/css">
		.form-control{
			width: 300px;
		}
	</style>
</head>
<body>
<form id="form" role="form">
	<table style="border-collapse: separate; border-spacing: 5px;">
		<tr>
			<td>
				用户姓名：
			</td>
			<td>
				<input type="hidden" id="id" name="id" value="${user.id }"/>
				<input type="text" id="name" name="name" class="form-control"
				       value="${user.name}" style="width: 300px;" placeholder="请填写用户姓名"/>
			</td>
		</tr>
		<tr>
			<td>
				手机号码：
			</td>
			<td>
				<input type="text" id="cellphone" name="cellphone"
				       value="${user.cellphone}" class="form-control" style="width: 300px;" placeholder="请填写手机号码"/>
			</td>
			<td>
				<label class="error" for="cellphone" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td>
				身份证号码：
			</td>
			<td>
				<input type="text" id="idCard" name="idCard"
				       value="${user.idCard}" class="form-control" style="width: 300px;" placeholder="请填写身份证号码"/>
			</td>
			<td>
				<label class="error" for="idCard" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td>
				系统状态：
			</td>
			<td>
				<input type="radio" name="status" value="0" >禁用
				<input type="radio" name="status" value="1" checked>启用
				<input type="radio" name="status" value="2" >未审核
				<input type="radio" name="status" value="3" >注销
			</td>
		</tr>
		<tr>
			<td>
				账户余额：
			</td>
			<td>
				<input type="text" id="money" name="money"
				       value="${user.money}" class="form-control""/>
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
