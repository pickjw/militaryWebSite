package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BbsDAO {

	// 변수선언
	private Connection conn;
	// private PreparedStatement pstmt; 함수맞찰우려
	private ResultSet rs;

	
	public BbsDAO() {
		// TODO Auto-generated constructor stub
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
	

	/*public BbsDAO() {
		try {
			// mysql 포트번호 3306
			String dbURL = "jdbc:mysql://localhost:3306/jw_board_db";
			String dbID = "jwboard";
			String dbPassword = "jw123";
			// mysql드라이버 연결 매개체
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			// 예외처리
		} catch (Exception e) {
			e.printStackTrace();// 예외처리
		
		if (connect) {
			System.out.println("연결o");
		} else {
			System.out.println("연결x");
		}
	}*/
	
	/*public BbsDAO() {
		// TODO Auto-generated constructor stub
		getCon();
		System.out.println("Connection 연결o");
	}
	
	// 커넥션 풀을 이용한 데이터 베이스 연결
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
			
				
		//현재 서버의 시간을 가져오기
	public String getDate() {
		
		//getCon();
		String SQL = "SELECT NOW()";//현재시간을 가져오는 SQL문장
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();//실제로 실행했을떄
			if (rs.next()) {
				return rs.getString(1);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	//게시판 ORDER BY bbsID 내림차순
	public int getNext() {
		
		//getCon();
		String SQL = "SELECT bbsID FROM noticeboard_db ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//게시글의 작성
	public int write(String bbsTitle, String userNickname, String bbsContent) {
		
		//getCon();
		String SQL = "INSERT INTO noticeboard_db VALUE (?, ?, ?, ?, ?, ?)";
		try { //(bbsTitle, userNickname, bbsDate, bbsContent, bbsAvailable) VALUES (?, ?, ?, ?, ?)
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userNickname);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);//삭제안된거 1
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	//ArrayList 게시판 가져오기
	//bbsAvailable 1인 글만 가져오기
	//내림차순으로 10개씩
	public ArrayList<Bbs> getlist(int pageNumber) {
		
		//getCon();
		String SQL = "SELECT * FROM noticeboard_db WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//getNext 5일경우 6으로 나옴 10개까지 글을 뽑아 오기
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserNickname(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	//페이징처리를 위해서 존재하는 함수 
	//nextPage int pageNumber
	public boolean nextPage(int pageNumber) {
		
		//getCon();
		String SQL = "SELECT * FROM noticeboard_db WHERE bbsID < ? AND bbsAvailable = 1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Bbs getBbs(int bbsID) {
		
		//getCon();
		String SQL = "SELECT * FROM noticeboard_db WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserNickname(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		
		//getCon();
		String SQL = "UPDATE noticeboard_db SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	public int delete (int bbsID) {
		//getCon();
		String SQL = "UPDATE noticeboard_db SET bbsAvailable = 0  WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
