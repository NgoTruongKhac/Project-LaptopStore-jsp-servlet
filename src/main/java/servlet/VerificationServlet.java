package servlet;

import java.io.IOException;

import bcrypt.BCrypt;
import dao.ForgotPassDAO;
import dao.RegisterDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/verifyCode")
public class VerificationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String verificationCode = (String) req.getSession().getAttribute("verificationCode");		
		String ConfirmverificationCode = req.getParameter("verificationCode");

		String email = (String) req.getSession().getAttribute("email");
		String newPass = (String) req.getSession().getAttribute("newPass");
		String userName = (String) req.getSession().getAttribute("userName");
		String pass = (String) req.getSession().getAttribute("pass");
		String hashedPassword = BCrypt.hashpw(pass, BCrypt.gensalt());

		User user = new User(userName, hashedPassword, email, verificationCode);

		
		long verificationTime = (long) req.getSession().getAttribute("verificationTime");

		long currentTime = System.currentTimeMillis();

		if (currentTime - verificationTime > 300000) {

			req.setAttribute("message", "mã xác nhận đã hết hạn.");
			req.setAttribute("type", "error");
			req.getRequestDispatcher("verify.jsp").forward(req, resp);

			return;

		}

		if (!verificationCode.equals(ConfirmverificationCode) ) {
			req.setAttribute("message", "Mã xác nhận không đúng.");
			req.setAttribute("type", "error");
			req.getRequestDispatcher("verify.jsp").forward(req, resp);
			return;
		}
		

		RegisterDAO registerDAO = new RegisterDAO();
		ForgotPassDAO forgotPass = new ForgotPassDAO();

		boolean isChangePass = forgotPass.isChangePass(newPass, email);

		boolean isVerified = registerDAO.verifyCode(user);

		if (isVerified) {

			req.setAttribute("message", "Đăng ký thành công! Bạn có thể đăng nhập.");
			req.setAttribute("type", "success");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		if (isChangePass) {
			req.setAttribute("message", "Đổi mật khẩu thành công! Bạn có thể đăng nhập.");
			req.setAttribute("type", "success");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}

	}

}
