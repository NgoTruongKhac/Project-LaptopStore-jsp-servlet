package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import dao.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// TODO Auto-generated method stub

		try {

			String userName = req.getParameter("userName");
			String pass = req.getParameter("pass");

			LoginDAO login = new LoginDAO();

			boolean isLogin = login.isSuccess(userName, pass);

			if (isLogin) {
				req.getSession().setAttribute("loggedInUser", userName);
				req.setAttribute("message", "Đăng Nhập thành công!");
				req.setAttribute("type", "success");
				// Chuyển hướng đến trang index.jsp
				req.getRequestDispatcher("index.jsp").forward(req, resp);

			} else {
				req.setAttribute("message", "Tài khoản hoặc mật khẩu không đúng!");
				req.setAttribute("type", "error");
				req.getRequestDispatcher("login.jsp").forward(req, resp);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
