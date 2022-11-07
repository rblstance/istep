package board;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.UserDao;
import util.DBManager;

public class BoardDao {
	private String url;
	private String user;
	private String password;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private BoardDao() {
		this.url = "jdbc:mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

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
		String sql = "insert into board values(?,?,?,?,?,?,?);";
		int no = noGenerator();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.setString(2, board.getUser_id());
			this.pstmt.setString(3, board.getTitle());
			this.pstmt.setString(4, board.getContent());
			
			Date now = new Date(System.currentTimeMillis());
			this.pstmt.setDate(5, now);
			this.pstmt.setInt(6, board.getCheck());
			this.pstmt.setInt(7, board.getSbj_code());
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

	public int noGenerator() {
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
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
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
				Date regdate = this.rs.getDate(5);
				int check = this.rs.getInt(6);
				int sbj_code = this.rs.getInt(7);
				
				BoardDto board = new BoardDto(no, user_id, title, content, regdate, check, sbj_code);
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
	// Read 각 서브젝트 내용만 읽기
	public ArrayList<BoardDto> getBoard_sbjAll(int code){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		String sql = "SELECT * FROM board where `sbj_code` = ? ORDER BY `no` desc";
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, code);
			this.rs = this.pstmt.executeQuery();
			
			while(this.rs.next()) {
				int no = this.rs.getInt(1);
				String user_id = this.rs.getString(2);
				String title = this.rs.getString(3);
				String content = this.rs.getString(4);
				Date regdate = this.rs.getDate(5);
				int check = this.rs.getInt(6);
				int sbj_code = this.rs.getInt(7);
				
				BoardDto board = new BoardDto(no, user_id, title, content, regdate, check, sbj_code);
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
				Date regdate = this.rs.getDate(5);
				int check = this.rs.getInt(6);
				int sbj_code = this.rs.getInt(7);
				
				board = new BoardDto(no, user_id,title,content,regdate,check,sbj_code);
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
	// read userId
	public String getNickBoard(String user_id) {
		String name = null;
		UserDao dao = UserDao.getInstance();
		String sql = "SELECT nickname FROM user WHERE `id` = ?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user_id);
			this.rs = this.pstmt.executeQuery();
			
			if(this.rs.next()) {
				name = this.rs.getString("nickname");
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
		return name;
	}
	
	
	//update
	public void updateBoard(BoardDto board) {
		
		String sql = "update board set title = ?, content = ? where `no` =?;";
		
		int no = board.getNo();
		String title = board.getTitle();
		String content = board.getContent();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			//this.pstmt.setString(2, "id"); // 유저 정보 가져오는 방법 필요
			this.pstmt.setString(1, title);
			this.pstmt.setString(2, content);
			this.pstmt.setInt(3, no);
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
	public void updateBoardCheck(int num) {
		String sql = "update board set `check` = 1 where `no` =?;";
		int no = num;
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	//delete
	public void DeleteBoard(int no) {
		String sql = "Delete from board where `no` = ?;";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, no);
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	
}
