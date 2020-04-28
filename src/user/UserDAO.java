package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/tutoring?"+
					"useUnicode=true&characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "root";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String ID, String password) {
		String SQL = "SELECT password FROM MEMBER WHERE ID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1; //login success
				}else {
					return 0; //password error
				}
			}
			return -1; // id 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //db 오류
	}
	public int update(String obj, int alert) {
		String SQL = "UPDATE MEMBER SET alert= ? WHERE ID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getAlert(obj)+alert);
			pstmt.setString(2, obj);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int getAlert(String obj) {
		String SQL = "SELECT alert FROM member where ID= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, obj);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 1; 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
}
