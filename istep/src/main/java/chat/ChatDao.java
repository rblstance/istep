package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

public class ChatDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private ChatDao() {
		this.url = "jdbc:mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static ChatDao instance = new ChatDao();
	
	public static ChatDao getInstance() {
		return instance;
	}
	
	// CREATE CHAT
		public void createChat(ChatDto chat) {
			
			String sql = "INSERT INTO chat VALUES(?, ?, ?)";
			try {
				this.conn = DBManager.getConnection(this.url, this.user, this.password);
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, chat.getUrl());
				this.pstmt.setString(2, chat.getUser_id());
				this.pstmt.setString(3, chat.getToken());
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
		
		// getToken
		public String getToken(String url, String user_id) {
			String token = "";
			String sql = "SELECT token FROM chat WHERE url=? AND user_id=?";
			try {
				this.conn = DBManager.getConnection(this.url, this.user, this.password);
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, url);
				this.pstmt.setString(2, user_id);
				this.rs = this.pstmt.executeQuery();
				
				token = this.rs.getString(1);
			} catch (Exception e) {
				e.printStackTrace();
			}  finally {
				try {
					this.rs.close();
					this.pstmt.close();
					this.conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return token;
		}
	
	
}
