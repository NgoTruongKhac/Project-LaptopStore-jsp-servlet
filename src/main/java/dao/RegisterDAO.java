package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.ConnectDatabase;
import entity.User;

public class RegisterDAO {

	private Connection conn;
	private ConnectDatabase db;

	public boolean isSuccess(String userName,String email) {
		// TODO Auto-generated method stub
		boolean isRegister = true;

		try {
		
			conn = db.getConnection();

			String insertSQL = "  select * from account where userName=? or email=?;";
			PreparedStatement pr = conn.prepareStatement(insertSQL);
			pr.setString(1, userName);
			pr.setString(2, email);
		
			ResultSet rs=pr.executeQuery();

			if(rs.next()) {
				isRegister=false;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return isRegister;
	}
	
	public boolean verifyCode(User user) {
		boolean isVerified = false;

		try {
			db = new ConnectDatabase();
			conn = db.getConnection();
			String verifySQL = "INSERT INTO account(userName, pass, email, verificationCode) VALUES (?, ?, ?, ?);";
			PreparedStatement pr = conn.prepareStatement(verifySQL);		
			pr.setString(1, user.getName());
			pr.setString(2, user.getPass());
			pr.setString(3, user.getEmail());
			pr.setString(4, user.getVerificationCode());

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
