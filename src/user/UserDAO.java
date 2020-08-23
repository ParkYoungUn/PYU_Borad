package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //DB에 접근하게 해주는 객체
	private PreparedStatement pstmt; //
	private ResultSet rs; // 정보를 담을수 있는 객체
	
	public UserDAO() {
		try {	// DB에 접속하게 해주는 try, catch
			String dbURL = "jdbc:mysql://localhost:3306/PYU_Board?useUnicode=true&characterEncoding=utf8";	//DB 접속	//useUnicode=true&characterEncoding=utf8 << DB에 한글 입력 안될때 해결법
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");	//MySql Driver
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);	//DB 접속
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";	//DB에 입력할 명령어
		
		try {
			pstmt = conn.prepareStatement(SQL);	// sql 문장을 DB에 삽입
			pstmt.setString(1,userID);	// *sql 인젝션같은 해킹을 방지하기 위한 수단
			rs = pstmt.executeQuery();	// 실행한 결과를 넣는다.
			
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일지 , 로그인 실패
				}
			}
			return -1;	// 아이디가 없다는 것
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 오류
	}
	
	public int join(User user) {
		String SQL = "insert into User values(?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);	// sql 문장을 DB에 삽입
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();  // 스테이트 먼트 실행 결과 넣기
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류.
	}
		
	
}
