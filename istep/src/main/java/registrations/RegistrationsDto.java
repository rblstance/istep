package registrations;

public class RegistrationsDto {
	
	private int no;
	private String user_id;
	private String sbj_code;
	
	public RegistrationsDto(int no, String user_id, String sbj_code) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.sbj_code = sbj_code;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSbj_code() {
		return sbj_code;
	}
	public void setSbj_code(String sbj_code) {
		this.sbj_code = sbj_code;
	}
	
	
}
