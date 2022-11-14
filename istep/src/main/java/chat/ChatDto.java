package chat;

public class ChatDto {

	private String url;
	private String user_id;
	private String token;
	private String message;
	
	public ChatDto(String url, String user_id, String token, String message) {
		super();
		this.url = url;
		this.user_id = user_id;
		this.token = token;
		this.message = message;
	}
	
	public ChatDto(String url, String user_id, String token) {
		super();
		this.url = url;
		this.user_id = user_id;
		this.token = token;
	}
	
	public String getUrl() {
		return url;
	}
	
//	public void setUrl(String url) {
//		this.url = url;
//	}
	
	public String getUser_id() {
		return user_id;
	}
	
//	public void setUser_id(String user_id) {
//		this.user_id = user_id;
//	}
	
	public String getToken() {
		return token;
	}
	
//	public void setToken(String token) {
//		this.token = token;
//	}
	
	public String getMessage() {
		return token;
	}
	
	public void setMessage(String token) {
		this.token = token;
	}
	
}
