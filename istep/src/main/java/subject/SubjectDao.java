package subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBManager;

public class SubjectDao {
	
	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private SubjectDao() {
		this.url = "jdbc:mysql://localhost:3306/istep";
		this.user = "root";
		this.password = "root";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static SubjectDao instance = new SubjectDao();
	
	public static SubjectDao getInstance() {
		return instance;
	}
	
	// CRUD
	
	// 1. Create
	public void addSubject(String name,String teacher,String explain, String kind){
		String sql = "INSERT INTO `subject` values(?,?,?,?,?)";
		
		int code = getCode();
		System.out.println(code);
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.pstmt.setString(2, name);
			this.pstmt.setString(3, teacher);
			this.pstmt.setString(4, explain);
			this.pstmt.setString(5, kind);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 2. Read
	// Read ALL
	public ArrayList<SubjectDto> getSubjectAll(){
		ArrayList<SubjectDto> sbjList = new ArrayList<SubjectDto>();
		String sql = "SELECT * FROM `subject`";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int code = this.rs.getInt(1);
				String name = this.rs.getString(2);
				String teacher = this.rs.getString(3);
				String explain = this.rs.getString(4);
				String kind = this.rs.getString(5);
				
				SubjectDto subject = new SubjectDto(code, name, teacher, explain, kind);
				sbjList.add(subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		return sbjList;
	}
	
	public SubjectDto getSubjectByCode(int code){
		SubjectDto subject = null;
		String sql = "SELECT * FROM `subject` WHERE `code`=?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				String name = this.rs.getString(2);
				String teacher = this.rs.getString(3);
				String explain = this.rs.getString(4);
				String kind = this.rs.getString(5);
				
				subject = new SubjectDto(code, name, teacher, explain, kind);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		return subject;
	}
	
	// 3. Update
	public void updSubject(SubjectDto subject){
		String sql = "UPDATE subject name=?, teacher=?, explain=?, kind=? WHERE code=?";
		
		int code = subject.getCode();
		String name = subject.getName();
		String teacher = subject.getTeacher();
		String explain = subject.getExplain();
		String kind = subject.getKind();
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.pstmt.setString(2, name);
			this.pstmt.setString(3, teacher);
			this.pstmt.setString(4, explain);
			this.pstmt.setString(5, kind);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 4. Delete
	public void delSubject(int code){
		String sql = "DELETE FROM subject WHERE code=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Other
	
	public int getCode() {
		int code = 0; 
		try {
			while(true) {
				code = (int) Math.floor((Math.random()*900000000)+100000000);
				String sql = "SELECT * FROM `subject` WHERE code=?";
				this.conn = DBManager.getConnection(this.url, this.user, this.password);
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, code);
				this.pstmt.execute();
				this.rs = this.pstmt.executeQuery();
				
				if(!this.rs.next()) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return code;
	}
}
