package board;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;


import util.DBManager;

public class BoardDao {
	private String url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
	private String user = "admin";
	private String password = "H77LtnHvcj6uYsgEv3ZT";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private BoardDao() {
		this.url = "";
		this.user = "";
		this.password = "";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	//CRED
	//create
	public void createBoard(BoardDto board) {
		String sql = "insert into board vlaues(?,?,?,?,?,?);";
		int no = noGenerator();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setString(2, board.getUser_id());
			this.pstmt.setString(3, board.getTitle());
			this.pstmt.setString(4, board.getContent());
			
			Timestamp now = new Timestamp(System.currentTimeMillis());
			this.pstmt.setTimestamp(5, now);
			this.pstmt.setInt(6, board.getCheck());
			
			this.pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
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
	
	private int noGenerator() {
		String sql = "SELECT MAX(`no`) FROM board;";
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
	// Read all
	public ArrayList<BoardDto> getBoardAll(){
		ArrayList<BoardDto> list = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY `no` DESC";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				String user_id = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Timestamp regdate = this.rs.getTimestamp(5);
				int check = this.rs.getInt(6);
				
				BoardDto board = new BoardDto(no, user_id, title, content, regdate, check);
				list.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		return list;
	}
	// Read one
	public BoardDto getBoardByNo(int no) {
		BoardDto board = null;
		String sql = "select * from board where `no` = ?;";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.rs=this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				String user_id = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Timestamp regdate = this.rs.getTimestamp(5);
				int check = this.rs.getInt(6);
				
				board = new BoardDto(no, user_id,title,content,regdate,check);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				this.rs.close();
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
		
		return board;
	}
	
	
}
