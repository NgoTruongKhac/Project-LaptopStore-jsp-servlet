package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import database.ConnectDatabase;
import entity.User;

public class RegisterDAO {

	private Connection conn;
	private ConnectDatabase db;

	public boolean isSuccess(User user) {
		// TODO Auto-generated method stub
		boolean isRegister = false;

		try {

		
			conn = db.getConnection();

			String insertSQL = "INSERT INTO account(userName, pass, email, verificationCode, isVerified) VALUES (?, ?, ?, ?, 0)";
			PreparedStatement pr = conn.prepareStatement(insertSQL);
			pr.setString(1, user.getName());
			pr.setString(2, user.getPass());
			pr.setString(3, user.getEmail());
			pr.setString(4, user.getVerificationCode());
		

			int i = pr.executeUpdate();

			if (i == 1) {
				isRegister = true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return isRegister;

	}


	
	public boolean verifyCode(String verificationCode) {
		boolean isVerified = false;

		try {
			db = new ConnectDatabase();
			conn = db.getConnection();
			String verifySQL = "UPDATE account SET isVerified = 1 WHERE  verificationCode = ?";
			PreparedStatement pr = conn.prepareStatement(verifySQL);		
			pr.setString(1, verificationCode);

			int i = pr.executeUpdate();

			if (i == 1) {
				isVerified = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isVerified;
	}


}
