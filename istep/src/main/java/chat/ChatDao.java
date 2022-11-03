package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.MemberDao;
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
		String code = createCode(chat.getHost_id());
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, code);
			this.pstmt.setString(2, chat.getName());
			this.pstmt.setString(3, chat.getHost_id());
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
		MemberDao mDao = MemberDao.getInstance();
		mDao.createMember(chat.getHost_id(), code);
	}
	
	// CREATE CODE
	public String createCode(String host_id) {
		String code = "";
		code += host_id.substring(0, 5);
		code += String.valueOf(getRnum());

		return code;
	}
	
	public int getRnum() {
		int code = 0;
		try {
			while(true) {
				String sql = "SELECT * FROM `chat` WHERE code=?";
				this.conn = DBManager.getConnection(this.url, this.user, this.password);
				this.pstmt = this.conn.prepareStatement(sql);
				int temp = (int)Math.floor(Math.random()*99999);
				this.pstmt.setInt(1, temp);
				this.rs = this.pstmt.executeQuery();
				
				if(!this.rs.next()) {
					code = temp;
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	
	// READ ALL
	public ArrayList<ChatDto> getChatAll(){
		ArrayList<ChatDto> list = new ArrayList<ChatDto>();
		String sql = "SELECT * FROM chat";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String code = this.rs.getString(1);
				String name = this.rs.getString(2);
				String host_id = this.rs.getString(3);
				
				ChatDto chat = new ChatDto(code, name, host_id);
				list.add(chat);
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
	// READ BY HOST_ID
	public ArrayList<ChatDto> getChatById(String host_id){
		ArrayList<ChatDto> list = new ArrayList<ChatDto>();
		String sql = "SELECT * FROM chat WHERE host_id=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, host_id);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				String code = this.rs.getString(1);
				String name = this.rs.getString(2);
				
				ChatDto chat = new ChatDto(code, name, host_id);
				list.add(chat);
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
	// READ BY CODE
	public ChatDto getChatByCode(String code){
		ChatDto chat = null;
		String sql = "SELECT * FROM chat WHERE code=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, code);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				String name = this.rs.getString(2);
				String host_id = this.rs.getString(3);
				
				chat = new ChatDto(code, name, host_id);
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
		return chat;
	}
	
	// DELETE BY CODE
	public void deleteChat(String code) {
		String sql = "DELETE FROM chat WHERE code=?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, code);
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
