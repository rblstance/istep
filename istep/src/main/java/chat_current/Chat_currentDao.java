package chat_current;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Chat_currentDao {

	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Chat_currentDao() {
		this.url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static Chat_currentDao instance = new Chat_currentDao();
	
	public static Chat_currentDao getInstance() {
		return instance;
	}
	
}
