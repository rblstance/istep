package registrations;

public class RegistrationsVo {
	
	private int no;
	private String user_id;
	private int sbj_code;
	
	public RegistrationsVo(int no, String user_id, int sbj_code) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.sbj_code = sbj_code;
	}
	
	public int getNo() {
		return no;
	}
	public String getUser_id() {
		return user_id;
	}
	public int getSbj_code() {
		return sbj_code;
	}
	
	
}
