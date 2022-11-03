package chat_log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		String sql = "INSERT INTO chat_log VALUES(?,?,?,?,?)";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			//this.pstmt.setInt(); //번호매기깅 1부터...........
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// READ ALL LOG
	//public ArrayList<Chat_>
	// READ ONE LOG
	
	
}
