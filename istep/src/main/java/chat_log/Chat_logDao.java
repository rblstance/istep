package chat_log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Chat_logDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Chat_logDao() {
		this.url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
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
	
}
