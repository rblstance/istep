package registrations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegistrationsDao {
	private String url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
	private String user = "admin";
	private String password = "H77LtnHvcj6uYsgEv3ZT";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private RegistrationsDao() {
		this.url = "";
		this.user = "";
		this.password = "";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
		
	}
	
	private static RegistrationsDao instance = new RegistrationsDao();
	
	public static RegistrationsDao getInstance() {
		return instance;
	}
}
