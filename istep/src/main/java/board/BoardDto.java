package board;

import java.security.Timestamp;

public class BoardDto {
	private int no;
	private String user_id;
	private String title;
	private String content;
	private Timestamp regdate;
	private int check;
	
	public BoardDto(int no, String user_id, String title, String content, Timestamp regdate, int check) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.check = check;
	}
	
	public int getNo() {
		return no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
//	public void setNo(int no) {
//		this.no = no;
//	}



}
