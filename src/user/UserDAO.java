package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//회원정보를 불러오거나 데이터베이스에 저장하기 위한 UserDAO
public class UserDAO {

	private Connection conn;// 데이터 베이스 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs;// 정보를 담을수 있는 객체

	public UserDAO() {
		
		Boolean connect = false;
	
		try {
			// mysql 포트번호 3306
			String dbURL = "jdbc:mysql://localhost:3306/jw_board_db";
			String dbID = "jwboard";
			String dbPassword = "jw123";
			// mysql드라이버 연결 매개체
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			connect = true;
			if (connect) {
				System.out.println("연결o");
			} else {
				System.out.println("연결x");
			
			}
			
				// 예외처리
			} catch (Exception e) {
				e.printStackTrace();// 예외처리
		
		}
	}
	
	

/*	// 커넥션 풀을 이용한 데이터 베이스 연결
	public void getCon() {

		Boolean connect = false;

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jwdb");

			conn = ds.getConnection();//
			connect = true;

		} catch (Exception e) {
			connect = false;
			e.printStackTrace();
		} 

		if (connect) {
			System.out.println("연결o");
		} else {
			System.out.println("연결x");
		}
	}*/

	public int login(String userEmail, String userPassword) {
		
		//getCon();

		// 실제로 명령해야 될 문장 구현
		String SQL = "SELECT userPassword FROM user_db WHERE userEmail = ? ";// ? 해킹방지

		try {
			pstmt = conn.prepareStatement(SQL);// prepareStatement SQL문장삽입
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();// rs객체에 실행결과 담기
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1;// 결과가 존재한다면 실행( 로그인 성공 )
				} else
					return 0; // 비밀번호 불일치
			}
			return -1;// 이메일이(id) 없다
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터 베이스 오류
	}

	// 사용자를 입력받기
	public int join(User user) {
		
		//getCon();

		String SQL = "INSERT INTO user_db VALUES (?, ? ,? ,? ,? )";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserNickname());
			pstmt.setString(5, user.getUserPhone());
			return pstmt.executeUpdate();// 실행결과 넣기
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스오루
	}

	// nickname 게시판 구현을 위한 loginaction에 구현
	// string 으로 nickname받아오기 String nickname =
	// userDAO.getNickname(user.getUserEmail());
	public String getNickname(String userEmail) {
		
		//getCon();

		// 실제로 명령해야 될 문장 구현
		String SQL = "SELECT userNickname FROM user_db WHERE userEmail = ? ";// ? 해킹방지

		String userNickname = "";
		try {
			pstmt = conn.prepareStatement(SQL);// prepareStatement SQL문장삽입
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();// rs객체에 실행결과 담기
			if (rs.next()) {
				userNickname = rs.getString(1);

			}
			return userNickname;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
