package review;

import java.security.Timestamp;

public class ReviewDto {
	private int no;
	private int sbj_code;
	private String id;
	private String title;
	private String content;
	private Timestamp regdate;
	
	
	public ReviewDto(int no, int sbj_code, String id, String title, String content, Timestamp regdate) {
		super();
		this.no = no;
		this.sbj_code = sbj_code;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	
	public int getNo() {
		return no;
	}
//	public void setNo(int no) {
//		this.no = no;
//	}
	public int getSbj_code() {
		return sbj_code;
	}
	public void setSbj_code(int sbj_code) {
		this.sbj_code = sbj_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	
}
