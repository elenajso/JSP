package education;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EducationDAO {
	private Connection conn;
	private ResultSet rs;
	
	public EducationDAO() {
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
	public ArrayList<Education> getEducation(){
		String SQL = "SELECT * FROM EDUCATION";
		ArrayList<Education> list = new ArrayList<Education>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Education education = new Education();
				education.setContentnumber(rs.getInt(1));
				education.setTitle(rs.getString(2));
				education.setUrl(rs.getString(3));
				education.setLmage(rs.getString(4));
				list.add(education);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
