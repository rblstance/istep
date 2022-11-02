package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class UserDao {
	private String url;
	private String user;
	private String password;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserDao() {
		this.url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
		this.user = "admin";
		this.password = "H77LtnHvcj6uYsgEv3ZT";

		this.conn = null;
		this.pstmt = null;
		this.rs = null;
	}
	
	
	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}
	
	// Create 계정 생성 
	public void createUser(UserDto user) {
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?)";

		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user.getId());
			this.pstmt.setString(2, user.getPassword());
			this.pstmt.setString(3, user.getName());
			this.pstmt.setString(4, user.getNickname());
			this.pstmt.setString(5, user.getPhone());
			this.pstmt.setString(6, user.getBirth());
			this.pstmt.setString(7, user.getEmail());
			this.pstmt.setString(8, user.getGrade());
			this.pstmt.setDate(9, user.getRegdate());;

			this.pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Read 모든 유저 출력
	public ArrayList<UserDto> getUserAll() {
		ArrayList<UserDto> list = new ArrayList<UserDto>();
		String sql = "SELECT * FROM user";

		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.rs = this.pstmt.executeQuery();

			while (this.rs.next()) {
				String id = this.rs.getString(1);
				String password = this.rs.getString(2);
				String name = this.rs.getString(3);
				String nickname = this.rs.getString(4);
				String phone = this.rs.getString(5);
				String birth = this.rs.getString(6);
				String email = this.rs.getString(7);
				String grade = this.rs.getString(8);
				Date regdate = this.rs.getDate(9);

				UserDto user = new UserDto(id, password, name, nickname, phone, birth, email, grade, regdate);
				list.add(user);
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
		return list;
	}
	
	// id를 받아서 유저 한명 정보 출력
	public UserDto getUserById(String id) {
		UserDto user = null;
		String sql = "SELECT * FROM user WHERE `id` = ?";

		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();

			if (this.rs.next()) {
				String password = this.rs.getString(2);
				String name = this.rs.getString(3);
				String nickname = this.rs.getString(4);
				String phone = this.rs.getString(5);
				String birth = this.rs.getString(6);
				String email = this.rs.getString(7);
				String grade = this.rs.getString(8);
				Date regdate = this.rs.getDate(9);

				user = new UserDto(id, password, name, nickname, phone, birth, email, grade, regdate);
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
		return user;
	}
	public int duplecateId(String id) {
		int cnt = 0;
		
		String sql = "SELECT count(`id`) as cnt FROM user WHERE `id` = ?";
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = this.rs.getInt("cnt");
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
		return cnt;
	}
	// id, pw 값을 받아서 맞으면 로그인 가능
	public int loginCheck(String id, String password) {
		int result = 0;
		String sql = "SELECT `password` FROM user WHERE `id` =?";

		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, id);
			this.rs = this.pstmt.executeQuery();

			if (this.rs.next()) {
				if (password.equals(rs.getString("password"))) {
					result = 1;
				} else {
					result = 0;
				}
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
		return result;
	}
	
	// Update 정보수정
	public void updateUserInfo(UserDto user) {
		String sql = "update user set `password`=?,`name`=?,nickname=?,phone=?,birth=?,email=?,grade=? where id = ?;";

		String id = user.getId();
		String password = user.getPassword();
		String name = user.getName();
		String nickname = user.getNickname();
		String phone = user.getPhone();
		String birth = user.getBirth();
		String email = user.getEmail();
		String grade = user.getGrade();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, password);
			this.pstmt.setString(2, name);
			this.pstmt.setString(3, nickname);
			this.pstmt.setString(5, phone);
			this.pstmt.setString(6, birth);
			this.pstmt.setString(7, email);
			this.pstmt.setString(8, grade);
			this.pstmt.setString(9, id);
			
			this.pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// delete 정보삭제
	public int deleteuser(String id, String password) {
		int result = 0;
		String sql = "SELECT `password` FROM user WHERE `id`=?";

		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, id);
			
			this.rs = this.pstmt.executeQuery();

			if (this.rs.next()) {
				if (password.equals(rs.getString("password"))) {
					String delsql = "DELETE FROM user WHERE id=?";
					this.pstmt = this.conn.prepareStatement(delsql);
					this.pstmt.setString(1, id);
					this.pstmt.executeUpdate();
					result = 1;
				} else {
					result = 0;
				}
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
		return result;
	}
}
