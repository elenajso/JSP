package boardreply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardreplyDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardreplyDAO() {
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

	public int getNext() {
		String SQL = "SELECT BRNumber FROM BOARDREPLY ORDER BY BRNumber DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
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
	public ArrayList<Boardreply> getClassBoardReply(int BoardNumber){
		String SQL = "SELECT * FROM BOARDREPLY WHERE BoardNumber = ? ORDER BY BRNumber DESC";
		ArrayList<Boardreply> list = new ArrayList<Boardreply>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  BoardNumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Boardreply boardreply = new Boardreply();
				boardreply.setBRNumber(rs.getInt(1));
				boardreply.setBoardNumber(rs.getInt(2));
				boardreply.setID(rs.getString(3));
				boardreply.setBRContents(rs.getString(4));
				boardreply.setBRDate(rs.getString(5));
				list.add(boardreply);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int write(String ID, String BRContents, int BoardNumber) {
		String SQL = "INSERT INTO BOARDREPLY VALUES (?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); 
			pstmt.setInt(2, BoardNumber); 
			pstmt.setString(3, ID);
			pstmt.setString(4, BRContents);
			pstmt.setString(5, getDate());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int update(int BRNumber, String BRContents) {
		String SQL = "UPDATE BOARDREPLY SET Contents= ? WHERE BRNumber =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, BRContents);
			pstmt.setInt(2, BRNumber);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
	public int delete(int BRNumber) {
		String SQL = "DELETE FROM BOARD WHERE BRNumber =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BRNumber);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db 오류
	}
}
