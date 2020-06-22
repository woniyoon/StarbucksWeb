package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {
	
	private DataSource ds; 
	// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. 
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes = null;
	
	// 생성자 
	public MemberDAO() {
		// 암호화/복호화 키 (양방향암호화) ==> 이메일,휴대폰의 암호화/복호화
		String key = EncryptMyKey.KEY;
		
		try {
		    Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			aes = new AES256(key);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	public void close() {
		try {
			if(rs != null) { rs.close(); rs=null; }
			if(pstmt != null) { pstmt.close(); pstmt=null; } 
			if(conn != null) { conn.close(); conn=null; }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	// 회원가입(insert)
	@Override
	public int registerMember(MemberVO membervo) throws SQLException {

		int result = 0;

		try {
			 conn = ds.getConnection();
			 
			 String sql = "insert into starbucks_Member(ID,PASSWORD,NAME,EMAIL,PHONE,POINT,GENDER,BIRTHDAY,REGISTER_DAY,STATUS) "       
				       + " values(?, ?, ?, ?, ?, default, ?, ?, default, default)";
			 
			 pstmt = conn.prepareStatement(sql);
				
			 pstmt.setString(1, membervo.getId());
			 pstmt.setString(2, Sha256.encrypt(membervo.getPassword())); // 암호를 SHA256 알고리즘으로 단방향암호화 시킨다. 
			 pstmt.setString(3, membervo.getName()); 
			 pstmt.setString(4, aes.encrypt(membervo.getEmail()) );  // 이메일을 AES256 알고리즘으로 양방향암호화 시킨다.
			 pstmt.setString(5, membervo.getPhone());
			 
			 String gender = "";
			 if("남".equals(membervo.getGender()))
				 gender = "1";
			 else
				 gender = "2";
			 
			 pstmt.setString(6, membervo.getGender());
			 			 
			 pstmt.setString(7, membervo.getBirthyyyy()+membervo.getBirthmm()+membervo.getBirthdd());
			 
			 result = pstmt.executeUpdate();
			 
		} catch( UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	
	
	// ID중복 검사 (userid가 중복이 없어서 사용가능하다라면 true, userid가 이미 존재하여 사용 불가능하면 false 를 리턴)  
	@Override
	public boolean idDuplicateCheck(String id) throws SQLException {
		
		boolean isUse = false;

		try {
			conn = ds.getConnection();
			
			String sql = " select id "
					   + " from starbucks_Member "
					   + " where id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			isUse = !rs.next();
		} finally {
			close();
		}
		
		return isUse;
	}
}
