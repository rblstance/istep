package answer_cerrent;

public class Answer_cerrentDto {
	private int no;
	private String user_id;
	private String a_code;
	
	
	
	public Answer_cerrentDto(int no, String user_id, String a_code) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.a_code = a_code;
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
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getA_code() {
		return a_code;
	}
	public void setA_code(String a_code) {
		this.a_code = a_code;
	}
	
	

}
