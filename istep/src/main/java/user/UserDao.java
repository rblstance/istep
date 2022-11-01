package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import util.DBManager;

public class UserDao {
	private String url = "mysql://database-1.c7ckrqjyxglw.ap-northeast-2.rds.amazonaws.com:3306/istep";
	private String user = "admin";
	private String password = "H77LtnHvcj6uYsgEv3ZT";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserDao() {
		this.url = "";
		this.user = "";
		this.password = "";

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
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?)";

		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, user.getId());
			this.pstmt.setString(2, user.getPassword());
			this.pstmt.setString(3, user.getName());
			this.pstmt.setString(4, user.getNickname());
			this.pstmt.setString(5, user.getPhone());
			this.pstmt.setString(6, user.getBirth());
			this.pstmt.setString(7, user.getRegistration());
			this.pstmt.setString(8, user.getEmail());
			this.pstmt.setString(9, user.getGrade());
			this.pstmt.setTimestamp(10, user.getRegdate());

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
				String registration = this.rs.getString(7);
				String email = this.rs.getString(8);
				String grade = this.rs.getString(9);
				Timestamp regdate = this.rs.getTimestamp(10);

				UserDto user = new UserDto(id, password, name, nickname, phone, birth, registration, email, grade, regdate);
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
				String registration = this.rs.getString(7);
				String email = this.rs.getString(8);
				String grade = this.rs.getString(9);
				Timestamp regdate = this.rs.getTimestamp(10);

				user = new UserDto(id, password, name, nickname, phone, birth, registration, email, grade, regdate);
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
	
	// id, pw 값을 받아서 맞으면 로그인 가능
	public int loginCheck(String id, String password) {
		int result = 0;
		String sql = "SELECT password FROM user WHERE id =?";

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
		String sql = "update user set password=?,name=?,nickname=?,phone=?,birth=?,registration=?,email=?,grade=? where id = ?;";

		String id = user.getId();
		String password = user.getPassword();
		String name = user.getName();
		String nickname = user.getNickname();
		String phone = user.getPhone();
		String birth = user.getBirth();
		String registration = user.getRegistration();
		String email = user.getRegistration();
		String grade = user.getRegistration();
		
		try {
			this.conn = DBManager.getConnection(this.url, this.user, this.password);
			this.pstmt = this.conn.prepareStatement(sql);
			this.pstmt.setString(1, password);
			this.pstmt.setString(2, name);
			this.pstmt.setString(3, nickname);
			this.pstmt.setString(5, phone);
			this.pstmt.setString(6, birth);
			this.pstmt.setString(7, registration);
			this.pstmt.setString(8, email);
			this.pstmt.setString(9, grade);
			this.pstmt.setString(10, id);
			
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
		String sql = "SELECT password FROM user WHERE `id`=?";

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
