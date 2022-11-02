package subject;

public class SubjectDto {
	private int code;
	private String name;
	private String teacher;
	private String explain;
	
	
	
	public SubjectDto(int code, String name, String teacher, String explain) {
		super();
		this.code = code;
		this.name = name;
		this.teacher = teacher;
		this.explain = explain;
	}
	
	public int getCode() {
		return code;
	}
//	public void setCode(int code) {
//		this.code = code;
//	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
}
