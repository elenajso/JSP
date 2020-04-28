package tclass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TclassDAO {
	private Connection conn;
	private ResultSet rs;
	
	public TclassDAO() {
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
	
	public ArrayList<Tclass> getTclass(){
		String SQL = "SELECT * FROM tutoring WHERE academicnumber=2";
		ArrayList<Tclass> list = new ArrayList<Tclass>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Tclass tclass = new Tclass();
				tclass.setAcademicNumber(rs.getInt(1));
				tclass.setID(rs.getString(2));
				tclass.setField(rs.getString(3));
				tclass.setSubject(rs.getString(4));
				tclass.setTutoringtitle(rs.getString(5));
				tclass.setApproval(rs.getInt(6));
				tclass.setApplication_start_date(rs.getString(7));
				tclass.setApplication_end_date(rs.getString(8));
				tclass.setClass_start_date(rs.getString(9));
				tclass.setClass_end_date(rs.getString(10));
				tclass.setMaxtuteenumber(rs.getInt(11));
				tclass.setCert(rs.getString(12));
				tclass.setAdvimage(rs.getString(13));
				tclass.setTutoringcontents(rs.getString(14));
				list.add(tclass);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}