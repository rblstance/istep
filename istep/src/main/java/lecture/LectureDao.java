package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class LectureDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private LectureDao() {
		this.url = "jdbc:mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static LectureDao instance = new LectureDao();
	
	public static LectureDao getInstance() {
		return instance;
	}
	
	// 1.create
	public ArrayList<LectureDto> addLecture(LectureDto lec){
		ArrayList<LectureDto> lectureList = new ArrayList<>();
		String sql = "INSERT INTO lecture VALUES(?,?,?,?,?,?,?)";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, lec.getCode());
			this.pstmt.setInt(2, lec.getSbjCode());
			this.pstmt.setString(3, lec.getName());
			this.pstmt.setString(4, lec.getThumbnail());
			this.pstmt.setString(5, lec.getUrl());
			this.pstmt.setInt(6, lec.getTime());
			this.pstmt.setTimestamp(7, lec.getRegDate());
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
	
		return lectureList;
	}
	
	
	// ALL Read
	public ArrayList<LectureDto> getLectureListBySbjCode(int sbjCode){
		ArrayList<LectureDto> lectureList = new ArrayList<>();
		String sql = "SELECT * FROM `lecture` WHERE `sbj_code`=?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, sbjCode);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String code = this.rs.getString(1);
				String name = this.rs.getString(3);
				String thumbnail = this.rs.getString(4);
				String url = this.rs.getString(5);
				int time = this.rs.getInt(6);
				Timestamp regDate = this.rs.getTimestamp(7);
				
				LectureDto lecture = new LectureDto(code, sbjCode, name, thumbnail,url, time, regDate);
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
	public LectureDto getLectureByCode(String code) {
		LectureDto lecture = null;
		String sql = "SELECT * FROM `lecture` WHERE `code`=?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, code);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				int sbjCode = this.rs.getInt(2);
				String name = this.rs.getString(3);
				String thumbnail = this.rs.getString(4);
				String url = this.rs.getString(5);
				int time = this.rs.getInt(6);
				Timestamp regDate = this.rs.getTimestamp(7);
				
				lecture = new LectureDto(code, sbjCode, name, thumbnail,url, time, regDate);
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
	
	public String getRegDate(Timestamp regDate) {
		String[] temp = regDate.toString().split("-");
		int y = Integer.parseInt(temp[0])-1900;
		int m = Integer.parseInt(temp[1])+1;
		int d = Integer.parseInt(temp[2].substring(0,2));
		
		return String.format("%d-%d-%d", y,m,d);
	}
}
