package servlet;

import java.io.IOException;

import dao.ForgotPassDAO;
import dao.RegisterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/verifyCode")
public class VerificationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String verificationCode = req.getParameter("verificationCode");

		RegisterDAO registerDAO = new RegisterDAO();
		ForgotPassDAO forgotPass=new ForgotPassDAO();
		
		
		
		String email = (String) req.getSession().getAttribute("email");
		String newPass = (String) req.getSession().getAttribute("newPass");
		
		boolean isChangePass=forgotPass.isChangePass(newPass, email);
		
		boolean isVerified = registerDAO.verifyCode(verificationCode);
		System.out.println(isChangePass);

		if (isVerified) {
			
			req.setAttribute("message", "Đăng ký thành công! Bạn có thể đăng nhập.");
			req.setAttribute("type", "success");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		if(isChangePass) {
			req.setAttribute("message", "Đổi mật khẩu thành công! Bạn có thể đăng nhập.");
			req.setAttribute("type", "success");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		
		else {
			req.setAttribute("message", "Mã xác nhận không hợp lệ hoặc đã hết hạn.");
			req.setAttribute("type", "error");			
			req.getRequestDispatcher("verify.jsp").forward(req, resp);
		}
	}
}
