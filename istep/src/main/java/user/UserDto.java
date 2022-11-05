package user;

import java.sql.Date;
import java.sql.Timestamp;

public class UserDto {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String birth;
	private String email;
	private String grade;
	private Timestamp regdate;
	
	// 수정할때 regdate 값 필요없어서
	public UserDto(String id, String password, String name, String nickname, String phone, String birth, String email, String grade) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.grade = grade;
	}
	
	public UserDto(String id, String password, String name, String nickname, String phone, String birth, String email, String grade, Timestamp regdate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.grade = grade;
		this.regdate = regdate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}

	
	
}