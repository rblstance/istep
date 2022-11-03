package chat_log;

import java.sql.Timestamp;

public class Chat_logDto {

	private int no;
	private String user_id;
	private String c_code;
	private String content;
	private Timestamp rogdate;
	
	public Chat_logDto(int no, String user_id, String c_code, String content, Timestamp rogdate) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.c_code = c_code;
		this.content = content;
		this.rogdate = rogdate;
	}

	public int getNo() {
		return no;
	}

//	public void setNo(int no) {
//		this.no = no;
//	}

	public String getUser_id() {
		return user_id;
	}

//	public void setUser_id(String user_id) {
//		this.user_id = user_id;
//	}

	public String getC_code() {
		return c_code;
	}

//	public void setC_code(String c_code) {
//		this.c_code = c_code;
//	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRogdate() {
		return rogdate;
	}

//	public void setRogdate(Timestamp rogdate) {
//		this.rogdate = rogdate;
//	}
	
	
	
	
}
