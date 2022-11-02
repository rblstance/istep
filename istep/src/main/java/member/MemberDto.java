package member;

import java.sql.Timestamp;

public class MemberDto {

	private String user_id;
	private String c_code;
	private Timestamp regdate;
	
	public MemberDto(String user_id, String c_code, Timestamp regdate) {
		super();
		this.user_id = user_id;
		this.c_code = c_code;
		this.regdate = regdate;
	}

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

	public Timestamp getRegdate() {
		return regdate;
	}

//	public void setRegdate(Timestamp regdate) {
//		this.regdate = regdate;
//	}
	
	
}
