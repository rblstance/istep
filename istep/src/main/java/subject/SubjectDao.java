package subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBManager;

public class SubjectDao {
	private String url = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String password = "root";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private SubjectDao() {
		this.url = "";
		this.user = "";
		this.password = "";

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
	
	// 2. Read
	// Read ALL
	public ArrayList<SubjectDto> getSubjectAll(){
		ArrayList<SubjectDto> sbjList = new ArrayList<SubjectDto>();
		String sql = "SELECT * FROM subject";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int code = this.rs.getInt(1);
				String name = this.rs.getString(2);
				String teacher = this.rs.getString(3);
				String explain = this.rs.getString(4);
				
				SubjectDto subject = new SubjectDto(code, name, teacher, explain);
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
		String sql = "SELECT * FROM subject	WHERE code=?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String name = this.rs.getString(2);
				String teacher = this.rs.getString(3);
				String explain = this.rs.getString(4);
				
				subject = new SubjectDto(code, name, teacher, explain);
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
	
	// 4. Delete
}
