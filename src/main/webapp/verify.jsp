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
			style="width: 250px; height: 310px; padding: 30px">
			<form action="verifyCode" method="post">
				<div class="text-body-tertiary mb-2 text-center">
					<i> mã xác nhận đã gửi về email của bạn</i>
				</div>
				<div class="d-flex justify-content-center text-center">
					<div id="countdown" style="font-size: 25px; color: red"></div>
				</div>
				<div class="mb-3 text-center">
					<label class="form-label" style="font-size: 20px">Nhập mã
						xác nhận</label> <input type="text" class="form-control"
						name="verificationCode" required="required" />
				</div>
				<div class="mb-3 d-flex justify-content-center">
					<button type="submit" class="btn btn-primary">Xác nhận</button>
				</div>
				<script>
					// Thời gian đếm ngược (5 phút)
					var countDownTime = 5 * 60 * 1000;
					var startTime = new Date().getTime();
					var expected = startTime + countDownTime;

					var x = setInterval(
							function() {
								var now = new Date().getTime();
								var distance = expected - now;

								var minutes = Math
										.floor((distance % (1000 * 60 * 60))
												/ (1000 * 60));
								var seconds = Math
										.floor((distance % (1000 * 60)) / 1000);

								document.getElementById("countdown").innerHTML = minutes
										+ " : " + seconds;

								if (distance < 0) {
									clearInterval(x);
									var countdownElement = document
											.getElementById("countdown");
									countdownElement.innerHTML = "Mã xác nhận đã hết hiệu lực.";
									countdownElement.style.fontSize = "20px";

								}
							}, 1000);
				</script>
			</form>
		</div>
	</div>

	<jsp:include page="components/alert.jsp"></jsp:include>

</body>
</html>