package answer_cerrent;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Answer_cerrentDao {
	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Answer_cerrentDao() {
		this.url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static Answer_cerrentDao instance = new Answer_cerrentDao();
	
	public static Answer_cerrentDao getInstance() {
		return instance;
	}
}