package chat_log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class Chat_logDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Chat_logDao() {
		this.url = "jdbc:mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static Chat_logDao instance = new Chat_logDao();
	
	public static Chat_logDao getInstance() {
		return instance;
	}
	
	// CREATE
	public void createChat_log(Chat_logDto log) {
		String sql = "INSERT INTO chat_log(`user_id`, `c_code`, `content`, `regdate`) VALUES(?,?,?,?)";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, log.getUser_id());
			this.pstmt.setString(2, log.getC_code());
			this.pstmt.setString(3, log.getContent());
			Timestamp now = new Timestamp(System.currentTimeMillis());
			this.pstmt.setTimestamp(4, now);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// READ ALL LOG BY C_CODE (채팅방 내 모든 로그)
	public ArrayList<Chat_logDto> getAllChat_logByC_code(String c_code){
		ArrayList<Chat_logDto> list = new ArrayList<Chat_logDto>();
		String sql = "SELECT * FROM chat_log WHERE c_code=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, c_code);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				String user_id = this.rs.getString(2);
				String content = this.rs.getString(4);
				Timestamp regdate = this.rs.getTimestamp(5);
				
				Chat_logDto chat_log = new Chat_logDto(no, user_id, c_code, content, regdate);
				list.add(chat_log);
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
	// READ ONE LOG
	public Chat_logDto getChat_logByNo(int no) {
		Chat_logDto chat_log = null;
		String sql = "SELECT * FROM chat_log WHERE no=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
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
		return chat_log;
	}
	// UPDATE
	
	// DELETE
	
}