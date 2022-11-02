package answer;

public class AnswerDto {
	private int code;
	private int b_num;
	private String user_id;
	private String content;
	private String regdate;
	
	public AnswerDto(int code, int b_num, String user_id, String content, String regdate) {
		super();
		this.code = code;
		this.b_num = b_num;
		this.user_id = user_id;
		this.content = content;
		this.regdate = regdate;
	}
	
	public int getCode() {
		return code;
	}
//	public void setCode(int code) {
//		this.code = code;
//	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	

}
