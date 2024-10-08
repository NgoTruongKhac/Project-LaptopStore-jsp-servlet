<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>register</title>
<%@ include file="components/allCss.jsp"%>
</head>
<body>
	<jsp:include page="components/navbar.jsp"></jsp:include>

	 <div class="d-flex justify-content-center mt-2" >
      <div
        style="border: solid; padding: 20px 20px 0px 20px; border-radius: 10px; width: 340px "
        class="bg-warning-subtle shadow-lg"
      >
        <form action="register" method="post">
          <div class="d-flex justify-content-center" style="margin-top: -10px">
            <h3>Đăng Ký</h3>
          </div>
          <div class="mb-2">
            <label class="form-label">Tên tài khoản </label> <input type="text"
            class="form-control" name="userName" required="required"
            value="<%=request.getParameter("userName") != null ?
            request.getParameter("userName") : ""%>">
          </div>
          <div class="mb-2">
            <label class="form-label">Email/Số điện thoại</label> <input
            type="text" class="form-control" name="email" required="required"
            value="<%=request.getParameter("email") != null ?
            request.getParameter("email") : ""%>">
          </div>
          <div class="mb-2">
            <label class="form-label">Mật khẩu</label>
            <input
              type="password"
              class="form-control"
              name="pass"
              required="required"
            />
          </div>
          <div class="mb-4">
            <label class="form-label">Nhập lại mật khẩu </label>
            <input
              type="password"
              class="form-control"
              name="confirmPass"
              required="required"
            />
          </div>
          <div class="mb-2 d-flex flex-column justify-content-between">
            <button type="submit" class="btn btn-primary mb-2">Đăng ký</button>
            <span class="align-self-center"
              >bạn đã có tài khoản ?<a href="login.jsp">Đăng nhập</a></span
            >
          </div>
        </form>
      </div>
    </div>

	<jsp:include page="components/alert.jsp"></jsp:include>





</body>
</html>