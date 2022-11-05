package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class MemberDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private MemberDao() {
		this.url = "jdbc:mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	// CREATE
	public void createMember(String user_id, String c_code) {
		String sql = "INSERT INTO member VALUES(?, ?, ?)";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user_id);
			this.pstmt.setString(2, c_code);
			Timestamp now = new Timestamp(System.currentTimeMillis());
			this.pstmt.setTimestamp(3, now);
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

	// READ MEMBERS BY C_CODE (채팅방 전체 회원 확인)
	public ArrayList<MemberDto> getMemberByC_code(String c_code){
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		MemberDto member = null;
		String sql = "SELECT * FROM member WHERE c_code=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, c_code);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String user_id = this.rs.getString(1);
				Timestamp regdate = this.rs.getTimestamp(3);
				
				member = new MemberDto(user_id, c_code, regdate);
				list.add(member);
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
		return list;
	}
	// READ c_code BY USER_ID (회원이 가입한 전체 채팅방[] 확인하기)
	public ArrayList<String> getCodeByUser_id(String user_id) {
		ArrayList<String> list = new ArrayList<String>();
		String sql = "SELECT c_code FROM member WHERE user_id=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user_id);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String c_code = this.rs.getString(1);
				list.add(c_code);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// DELETE MEMBER
	public void deleteMember(String user_id, String c_code) {
		String sql = "DELETE FROM member WHERE user_id=? AND c_code=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user_id);
			this.pstmt.setString(2, c_code);
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
}
