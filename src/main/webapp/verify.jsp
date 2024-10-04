<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>verification</title>
<%@ include file="components/allCss.jsp"%>
</head>
<body>
	<div class="d-flex justify-content-center mt-3">
		<div class="card bg-success-subtle"
			style="width: 250px; height: 250px; padding: 30px">
			<form action="verifyCode" method="post">
				<div class="text-body-tertiary mb-2">
					<i> mã xác nhận đã gửi về email của bạn</i>
				</div>
				<div class="mb-3">
					<label class="form-label" style="font-size: 20px">Nhập
						mã xác nhận</label> <input type="text" class="form-control"
						name="verificationCode" required="required" />
				</div>
				<div class="mb-3 d-flex justify-content-center">
					<button type="submit" class="btn btn-primary">Xác nhận</button>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="components/alert.jsp"></jsp:include>

</body>
</html>