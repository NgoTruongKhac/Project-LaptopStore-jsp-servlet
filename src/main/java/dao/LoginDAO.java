package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bcrypt.BCrypt;
import database.ConnectDatabase;
import entity.User;

public class LoginDAO {

	private Connection conn;
	private ConnectDatabase db;

	public boolean isSuccess(String userName, String pass) {
		// TODO Auto-generated method stub
		boolean isLogin = false;
		

		try {
			
			conn = db.getConnection();
			String SQLLogin = "SELECT * FROM account WHERE userName = ?";
			PreparedStatement pr = conn.prepareStatement(SQLLogin);

			// Gán giá trị cho các tham số
			pr.setString(1, userName);
			

			// Sử dụng executeQuery() để thực hiện câu lệnh SELECT
			ResultSet rs = pr.executeQuery();

			// Kiểm tra nếu có kết quả trả về, nghĩa là đăng nhập thành công
			if (rs.next()) {
				String hashedPass=rs.getString("pass");
				
				if(BCrypt.checkpw(pass, hashedPass)) {
					isLogin=true;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// Đóng tài nguyên sau khi sử dụng
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isLogin;
	}

}
