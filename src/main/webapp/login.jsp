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
		<div style="border: solid; padding: 25px; border-radius: 10px"
			class="bg-warning-subtle shadow-lg">
			<form action="login" method="post">
				<div class="d-flex justify-content-center" style="margin-top: -10px">
					<h3>Đăng Nhập</h3>
				</div>
				<div class="mb-3">
					<label class="form-label">Tên tài khoản </label> <input type="text"
						class="form-control" name="userName" required="required" />
				</div>
				<div class="mb-3">
					<label class="form-label">Mật khẩu</label> <input type="password"
						class="form-control" name="pass" required="required" />
				</div>

				<div class="mt-4 d-flex flex-column">
					<button type="submit" class="btn btn-primary">Đăng Nhập</button>
					<span class="mt-2 align-self-center">bạn
						chưa có tài khoản ?<a href="register.jsp">Đăng ký</a>
					</span> <span class="mt-2 align-self-center">bạn
						quên mật khẩu ?<a href="forgotPass.jsp">quên
							mật khẩu</a>
					</span>
				</div>
				<div class="mt-4 d-flex flex-column">

					<a href="loginWithSMS.jsp" class="btn btn-primary">
						<i class="bi bi-telephone-fill"></i> đăng nhập với SMS
					</a>
				</div>
		</div>
		</form>
	</div>
	</div>

	<jsp:include page="components/alert.jsp"></jsp:include>

</body>
</html>