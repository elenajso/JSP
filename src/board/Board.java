package board;

public class Board {
	private int BoardNumber;
	private String AcademicNumber;
	private String ID;
	private String title;
	private String contents;
	private String Date;
	private int code;
	private int views;
	public int getBoardNumber() {
		return BoardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		BoardNumber = boardNumber;
	}
	public String getAcademicNumber() {
		return AcademicNumber;
	}
	public void setAcademicNumber(String academicNumber) {
		AcademicNumber = academicNumber;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getcontents() {
		return contents;
	}
	public void setcontents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public int getcode() {
		return code;
	}
	public void setcode(int code) {
		this.code = code;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}
