package evaluation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class EvaluationDAO {
	private Connection conn;
	private ResultSet rs;
	
	public EvaluationDAO() {
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
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //db 오류
	}
	public ArrayList<Evaluation> getEvaluation(){
		String SQL = "SELECT * FROM EVALUATION where academicnumber= 2";
		ArrayList<Evaluation> list = new ArrayList<Evaluation>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Evaluation evaluation = new Evaluation();
				evaluation.setAcademicNumber(rs.getInt(1));
				evaluation.setID(rs.getString(2));
				evaluation.setKindness(rs.getInt(3));
				evaluation.setSincerity(rs.getInt(4));
				evaluation.setCurriculum(rs.getInt(5));
				evaluation.setInterest(rs.getInt(6));
				evaluation.setDelivery(rs.getInt(7));
				evaluation.setComent(rs.getString(8));
				evaluation.setEvaluation_date(rs.getString(9));
				list.add(evaluation);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Evaluation getEvaluationTotal() {
		String SQL = "select sum(kindness)/count(academicnumber),sum(sincerity)/count(academicnumber),sum(curriculum)/count(academicnumber),sum(interest)/count(academicnumber),sum(delivery)/count(academicnumber) from evaluation where academicnumber=2";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Evaluation evaluation = new Evaluation();
				evaluation.setKindness(rs.getInt(1));
				evaluation.setSincerity(rs.getInt(2));
				evaluation.setCurriculum(rs.getInt(3));
				evaluation.setInterest(rs.getInt(4));
				evaluation.setDelivery(rs.getInt(5));
				return evaluation;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int write(String ID, int kindness, int sincerity, int curriculum, int interest, int delivery, String coment) {
		String SQL = "INSERT INTO evaluation VALUES (2,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//AcademicNumber
			pstmt.setString(1, ID);
			pstmt.setInt(2, kindness);
			pstmt.setInt(3, sincerity);
			pstmt.setInt(4, curriculum);
			pstmt.setInt(5, interest);
			pstmt.setInt(6, delivery);
			pstmt.setString(7, coment);
			pstmt.setString(8, getDate());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
}
