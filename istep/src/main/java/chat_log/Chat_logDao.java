package chat_log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Chat_logDao {

	private String url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
	private String user = "admin";
	private String password = "H77LtnHvcj6uYsgEv3ZT";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Chat_logDao() {
		this.url = "";
		this.user = "";
		this.password = "";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static Chat_logDao instance = new Chat_logDao();
	
	public static Chat_logDao getInstance() {
		return instance;
	}
	
	// CREATE
	
	
}
