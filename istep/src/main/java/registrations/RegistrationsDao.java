package registrations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import lecture.LectureDto;
import util.DBManager;

public class RegistrationsDao {
	
	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private RegistrationsDao() {
		this.url = "jdbc:mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static RegistrationsDao instance = new RegistrationsDao();
	
	public static RegistrationsDao getInstance() {
		return instance;
	}
	
	// 1. create
	public void addRegistrations(String id, int sbjCode) {
		String sql = "INSERT INTO `registrations` VALUES(?,?,?)";
		int no = getNewNo();
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setString(2, id);
			this.pstmt.setInt(3, sbjCode);
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
	
	// read
	public ArrayList<RegistrationsVo> getRegistrationsById(String userId) {
		ArrayList<RegistrationsVo> registrationList = new ArrayList<>();
		String sql = "SELECT * FROM `registrations` WHERE `user_id`=?";
		
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, userId);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				String user_id = this.rs.getString(2);
				int sbj_code = this.rs.getInt(3);
				
				RegistrationsVo regist = new RegistrationsVo(no, user_id, sbj_code);
				registrationList.add(regist);
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
	
		return registrationList;
	}
	
	
	public int getNewNo() {
		String sql = "SELECT MAX(`no`) FROM `registrations`;";
		int no = 0;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				no = this.rs.getInt(1);
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
		return ++no;
	}
	
	public boolean duplCheckBySbjCode(int sbjCode, String id) {
		boolean dupl = false;
		String sql = "SELECT * FROM `registrations` WHERE sbj_code=? AND user_id=?";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, sbjCode);
			this.pstmt.setString(2, id);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				dupl = true;
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
		
		return dupl;
	}
}
