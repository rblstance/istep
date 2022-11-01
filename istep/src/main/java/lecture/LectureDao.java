package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class LectureDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url;
	private String user;
	private String password;
	
	private LectureDao() {
		this.conn = null;
		this.pstmt = null;
		this.rs = null;
		
		this.url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";
	}
	
	private static LectureDao instance = new LectureDao();
	
	public static LectureDao getInstance() {
		return instance;
	}
	
	
	// ALL Read
	public ArrayList<LectureDto> getLectureList(){
		ArrayList<LectureDto> lectureList = new ArrayList<>();
		String sql = "SELECT * FROM lecture";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				int sbjCode = this.rs.getInt(2);
				String name = this.rs.getString(3);
				String thumbnail = this.rs.getString(4);
				String url = this.rs.getString(5);
				int time = this.rs.getInt(6);
				Timestamp regDate = this.rs.getTimestamp(7);
				
				LectureDto lecture = new LectureDto(no, sbjCode, name, thumbnail,url, time, regDate);
				lectureList.add(lecture);
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
	
		return lectureList;
	}
	
	// Read One
	public LectureDto getLectureByNo(int no) {
		LectureDto lecture = null;
		String sql = "SELECT * FROM lecture WHERE `no`=?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				int sbjCode = this.rs.getInt(2);
				String name = this.rs.getString(3);
				String thumbnail = this.rs.getString(4);
				String url = this.rs.getString(5);
				int time = this.rs.getInt(6);
				Timestamp regDate = this.rs.getTimestamp(7);
				
//				LectureDto lecture = new LectureDto(no, sbjCode, name, thumbnail,url, time, regDate);
//				lectureList.add(lecture);
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
	
		return lecture;
	}
}
