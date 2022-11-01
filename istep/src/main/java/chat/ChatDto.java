package chat;

public class ChatDto {

	private String code;
	private String name;
	private String member;
	private String host_id;
	
	public ChatDto(String code, String name, String member, String host_id) {
		super();
		this.code = code;
		this.name = name;
		this.member = member;
		this.host_id = host_id;
	}
	
	public String getCode() {
		return code;
	}
	
//	public void setCode(String code) {
//		this.code = code;
//	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMember() {
		return member;
	}
	
	public void setMember(String member) {
		this.member = member;
	}
	
	public String getHost_id() {
		return host_id;
	}
	
//	public void setHost_id(String host_id) {
//		this.host_id = host_id;
//	}
	
	
	
}
