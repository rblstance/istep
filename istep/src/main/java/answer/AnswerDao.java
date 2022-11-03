package answer;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBManager;

public class AnswerDao {
	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AnswerDao() {
		this.url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static AnswerDao instance = new AnswerDao();
	
	public static AnswerDao getInstance() {
		return instance;
	}
	
	//CRED
	// 댓글 만들기
	public void createAnswer(AnswerDto answer) {
		String sql = "insert into answer values(?,?,?,?,?);";
		int no = noAnswerGenerator();
		
		try {
			Date now = new Date(System.currentTimeMillis());
			
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setInt(2, answer.getB_num());
			this.pstmt.setString(3, answer.getUser_id());
			this.pstmt.setString(4, answer.getContent());
			this.pstmt.setDate(5, now);
			this.pstmt.execute();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	public int noAnswerGenerator() {
		String sql = "SELECT MAX(`code`) FROM board;";
		int no = 0;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				no = this.rs.getInt(1);
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
		return ++no;
	}
	//ReadAll
	// 2022-11-03 진행중 멈춤
	public ArrayList<AnswerDto> getAnswerAll(int b_num){
		ArrayList<AnswerDto> list = new ArrayList<AnswerDto>();
		String sql = "select * from answer order by `code` desc where b_num=?";
		
		try {
			this.conn =DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, b_num);
			this.rs = this.pstmt.executeQuery();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
