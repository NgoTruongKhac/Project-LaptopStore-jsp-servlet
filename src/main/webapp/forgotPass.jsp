<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="components/allCss.jsp" %>
</head>
<body>

 <div class="mt-5 d-flex justify-content-center">
      <div
        class="card bg-info-subtle"
        style="width: 300px; height: 350px; padding: 30px"
      >
        <form action="forgotPass" method="post">
          <div class="d-flex justify-content-center">
            <h3>Tạo mới mật khẩu</h3>
          </div>
          <div>
            <label class="form-label">email:</label>
            <input class="form-control" type="email" name="email" required="required" />
          </div>
          <div>
            <label class="form-label">mật khẩu mới:</label>
            <input class="form-control" type="password" name="newPass" />
          </div>
          <div>
            <label class="form-label">xác nhận mật khẩu mới:</label>
            <input class="form-control" type="password" name="ConfirmNewPass" required="required" />
          </div>
          <div class="mt-3 d-flex justify-content-center">
            <button class="btn btn-primary" type="submit">Tạo mới</button>
          </div>
        </form>
      </div>
    </div>

</body>
</html>