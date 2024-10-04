package servlet;

import java.io.IOException;
import java.util.UUID;

import bcrypt.BCrypt;
import dao.RegisterDAO;
import entity.EmailUtil;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			String userName = req.getParameter("userName");
			String pass = req.getParameter("pass");
			String email = req.getParameter("email");
			String confirmPass = req.getParameter("confirmPass");

			if (!pass.equals(confirmPass)) {

				req.setAttribute("message", "Mật khẩu không trùng khớp!");
				req.setAttribute("type", "error");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
				return;

			}

			String hashedPassword = BCrypt.hashpw(pass, BCrypt.gensalt());



			String verificationCode = String.valueOf((int) (Math.random() * 900000) + 100000);

			User user = new User(userName, hashedPassword, email, verificationCode);

			RegisterDAO register = new RegisterDAO();

			boolean isRegister = register.isSuccess(user);
//
			if (isRegister) {

				String subject = "Mã xác nhận đăng ký";
				
				EmailUtil.sendEmail(email, subject, verificationCode);

				req.getRequestDispatcher("verify.jsp").forward(req, resp);

			} else {
				req.setAttribute("message", "Tài khoản hoặc email đã tồn tại!");
				req.setAttribute("type", "error");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			}

			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
