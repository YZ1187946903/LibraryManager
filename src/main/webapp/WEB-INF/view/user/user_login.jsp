<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书信息管理系统</title>
		<!-- http://localhost:8080/library/user/login -->
		<link rel="stylesheet" type="text/css" href="../static/css/login_form.css">
	</head>
	<body>
		<div class="login">
		<form method="post" action="login">
			<table>
				<caption>Library-系统（登录）</caption>
				<tr>
					<td>
						<div class="login-box">
							<input type="text" name="username" required pattern="^1[0-9]{10}$">
							<label>用户名</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="login-box">
							<input type="password" name="password" required>
							<label>密码</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="login-a">
							<button type="submit" class="b1">
								登录
					<!--			四个span是用于制作登录附近四周的动画用-->
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</button>
							<a href="register" class="b2">
								注册
					<!--			四个span是用于制作登录附近四周的动画用-->
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</body>
</html>