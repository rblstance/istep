package answer_cerrent;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Answer_cerrentDao {
	private String url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
	private String user = "admin";
	private String password = "H77LtnHvcj6uYsgEv3ZT";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Answer_cerrentDao() {
		this.url = "";
		this.user = "";
		this.password = "";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static Answer_cerrentDao instance = new Answer_cerrentDao();
	
	public static Answer_cerrentDao getInstance() {
		return instance;
	}
}