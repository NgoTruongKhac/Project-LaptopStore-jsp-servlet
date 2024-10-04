<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>
<%@ include file="components/allCss.jsp"%>
</head>
<body>
	<jsp:include page="components/navbar.jsp"></jsp:include>

	<div class="d-flex justify-content-center mt-4">

		<div class="card bg-warning-subtle"
			style="width: 380px; height: 390px; padding: 30px">


			<form action="login" method="post">
				<div class="d-flex justify-content-center"
					style="margin-top: -10px;">
					<h3>Đăng Nhập</h3>
				</div>
				<div class="mb-3">
					<label class="form-label">Tên tài khoản </label> <input type="text"
						class="form-control" name="userName" required="required">
				</div>
				<div class="mb-3">
					<label class="form-label">Mật khẩu</label> <input type="password"
						class="form-control" name="pass" required="required">
				</div>

				<div class="mt-4 d-flex flex-column">
					<button type="submit" class="btn btn-primary">Đăng Nhập</button>
					<span class="mt-2 align-self-center">bạn chưa có tài khoản ?<a
						href="register.jsp">Đăng ký</a></span>
						<span class="mt-2 align-self-center">bạn quên mật khẩu ?<a href="forgotPass.jsp">quên mật khẩu</a></span>
				</div>
			</form>
		</div>
	</div>
	

 <jsp:include page="components/alert.jsp"></jsp:include>

</body>
</html>