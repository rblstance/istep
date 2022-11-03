package lecture;

import java.sql.Timestamp;

public class LectureDto {
	
	// Member
	private String code;
	private int sbjCode;
	private String name;
	private String thumbnail;
	private String url;
	private int time;
	private Timestamp regDate;
	
	// All Arguments Constructor
	public LectureDto(String code, int sbjCode, String name, String thumbnail, String url, int time, Timestamp regDate) {
		super();
		this.code = code;
		this.sbjCode = sbjCode;
		this.name = name;
		this.thumbnail = thumbnail;
		this.url = url;
		this.time = time;
		this.regDate = regDate;
	}

	// Getter & Setter
	public String getCode() {
		return code;
	}

	public int getSbjCode() {
		return sbjCode;
	}

	public String getName() {
		return name;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public String getUrl() {
		return url;
	}

	public int getTime() {
		return time;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setTime(int time) {
		this.time = time;
	}
	
	
}
