<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<!-- http://localhost:8080/library/role/update/1 -->
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
						url: "../update",   // url 变为 user/update不能写成 ../ --> 会变成 role/
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
							parent.openFrame("fa fa-user-circle", "角色信息", "fa fa-cog", "系统管理", "role/index");
						}
					});
				},
				// 对于表单校验方式
				rules: {
					"name": {
						// 校验规则
						required: true,
						rangelength: [2, 10],
						// *****异步校验角色名称是否重复*****
						remote: {
							url: "../check/name",
							type: "post",
							dataType: "json",
							data: {
								"name": function () {
									return $("#name").val();
								}
							}
						}
					}
				},
				// 表单校验错误时的提示信息
				messages: {
					"name": {
						// 校验规则
						required: "请填写角色名称",
						rangelength: "角色名称在两个字到十个字之间",
						remote: "该角色名称已被使用"
					}
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
				<i class="fa fa-key"></i>&nbsp;
				角色名称：
			</td>
			<td>
				<input type="text" id="name" name="name" class="form-control" style="width: 300px;" placeholder="请填写角色名称"/>
				<input type="hidden" id="id" name="id" value="${id}">
			</td>
			<td>
				<label class="error" for="name" style="color: red;"></label>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;">
				<button type="submit" class="btn btn-success">
					<i class="fa fa-save"></i>&nbsp;
					修改
				</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
