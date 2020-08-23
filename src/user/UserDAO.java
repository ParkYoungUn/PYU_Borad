package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //DB�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt; //
	private ResultSet rs; // ������ ������ �ִ� ��ü
	
	public UserDAO() {
		try {	// DB�� �����ϰ� ���ִ� try, catch
			String dbURL = "jdbc:mysql://localhost:3306/PYU_Board?useUnicode=true&characterEncoding=utf8";	//DB ����	//useUnicode=true&characterEncoding=utf8 << DB�� �ѱ� �Է� �ȵɶ� �ذ��
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");	//MySql Driver
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);	//DB ����
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";	//DB�� �Է��� ��ɾ�
		
		try {
			pstmt = conn.prepareStatement(SQL);	// sql ������ DB�� ����
			pstmt.setString(1,userID);	// *sql �����ǰ��� ��ŷ�� �����ϱ� ���� ����
			rs = pstmt.executeQuery();	// ������ ����� �ִ´�.
			
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // �α��� ����
				} else {
					return 0; // ��й�ȣ ������ , �α��� ����
				}
			}
			return -1;	// ���̵� ���ٴ� ��
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // DB ����
	}
	
	public int join(User user) {
		String SQL = "insert into User values(?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);	// sql ������ DB�� ����
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();  // ������Ʈ ��Ʈ ���� ��� �ֱ�
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����.
	}
		
	
}
