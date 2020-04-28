package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ApplicationDAO {
	private Connection conn;
	private ResultSet rs;
	
	public ApplicationDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:z/tutoring?"+
					"useUnicode=true&characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "root";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Application> getParticipant(){
		String SQL = "SELECT ID FROM APPLICATION WHERE ACADEMICNUMBER = 2";
		ArrayList<Application> list = new ArrayList<Application>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Application application = new Application();
				application.setID(rs.getString(1));
				list.add(application);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
