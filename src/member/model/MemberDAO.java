package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.HashMap;

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
			 
			 String sql = "insert into starbucks_Member(Member_seq,USERID,PASSWORD,NAME,EMAIL,HP1,HP2,HP3,POINT,GENDER,BIRTHDAY,REGISTER_DAY,STATUS) "       
				       + " values(seq_starbucks_Member.nextval,?, ?, ?, ?, ?, ?, ?, default, ?, ?, default, default)";
			 
			 pstmt = conn.prepareStatement(sql);
				
			 pstmt.setString(1, membervo.getUserid());
			 pstmt.setString(2, Sha256.encrypt(membervo.getPassword())); // 암호를 SHA256 알고리즘으로 단방향암호화 시킨다. 
			 pstmt.setString(3, membervo.getName()); 
			 pstmt.setString(4, aes.encrypt(membervo.getEmail()) );  // 이메일을 AES256 알고리즘으로 양방향암호화 시킨다.
			 pstmt.setString(5, membervo.getHp1());    
			 pstmt.setString(6, membervo.getHp2());    
			 pstmt.setString(7, membervo.getHp3());    
			 
			 pstmt.setInt(8, membervo.getGender());
			 			 
			 pstmt.setString(9, membervo.getBirthyyyy()+membervo.getBirthmm()+membervo.getBirthdd());
			 
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
	public boolean idDuplicateCheck(String userid) throws SQLException {
		
		boolean isUse = false;

		try {
			conn = ds.getConnection();
			
			String sql = " select userid "
					   + " from starbucks_Member "
					   + " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			isUse = !rs.next();
		} finally {
			close();
		}
		
		return isUse;
	}


	// 아이디와 암호를 입력받아서 그 회원에 대한 정보를 리턴(로그인처리)
	@Override
	public MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException {

		MemberVO mvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, name, email, hp1, hp2, hp3, point, gender " +
						 "     , substr(Birthday,1,4) AS Birthyyyy, substr(Birthday,5,2) AS Birthmm, substr(Birthday, 7) AS Birthdd "+
						 " from starbucks_Member "+
						 " where status = 1 and userid = ? and password = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt( paraMap.get("password")) );
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mvo = new MemberVO();
				mvo.setUserid(rs.getString("userid"));
				mvo.setName(rs.getString("name"));
				mvo.setEmail(aes.decrypt(rs.getString("email"))); // 복호화
				mvo.setHp1(rs.getString("hp1"));
				mvo.setHp2(rs.getString("hp2")); 
				mvo.setHp3(rs.getString("hp3")); 

				mvo.setPoint(rs.getInt("point")); // int

			    mvo.setGender(rs.getInt("gender"));

				/*String sex = null;
				if(rs.getInt("gender") == 1) {
					sex = "남";
				}
				else 
					sex = "여";*/
			    
			    mvo.setBirthyyyy(rs.getString("Birthyyyy"));
			    mvo.setBirthmm(rs.getString("Birthmm"));
			    mvo.setBirthdd(rs.getString("Birthdd"));
			    
			    }

		} catch(UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mvo;
	}


	// 아이디 찾기(성명, 휴대폰번호를 입력받아서 해당 사용자의 아이디를 알려준다.)
	@Override
	public String findUserid(HashMap<String, String> paraMap) throws SQLException {

		String userid = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid " +
						 " from starbucks_Member " + 
						 " where status = 1 and " + 
						 " name = ? and " + 
						 " trim(hp1) || trim(hp2) || trim(hp3) = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("name"));

			
			pstmt.setString(2, paraMap.get("hp1")+paraMap.get("hp2")+paraMap.get("hp3"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userid = rs.getString("userid");
			}
		} finally {
			close();
		}
		
		return userid;
	}



	// 비밀번호 변경
	@Override
	public String selectPasswd(String userid) throws SQLException {
		String password = null;
		
		try {
			conn = ds.getConnection();
			String sql = " select password from starbucks_member where userid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				password = rs.getString("password");
			}
		} finally {
			close();
		}
	
		return password;
	}




	// 비밀번호 찾기(아이디, 이메일을 입력받아서 해당 사용자가 존재하는지 유무를 알려준다.)
	   @Override
	   public boolean isUserExist(HashMap<String, String> paraMap) throws SQLException {
	      
	      boolean isUserExist = false;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select userid " +
	                   	  " from starbucks_Member " + 
	                   	  " where status = 1 and " + 
	                   	  " userid = ? and " + 
	                   	  " email = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, paraMap.get("userid"));
	         pstmt.setString(2, aes.encrypt(paraMap.get("email")));

	         rs = pstmt.executeQuery();
	         
	         isUserExist = rs.next();
	         
	      } catch(UnsupportedEncodingException | GeneralSecurityException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return isUserExist;
	   }
	   
	   
	// 암호 변경 하기
	   @Override
	   public int pwdUpdate(String password, String userid) throws SQLException {
	      
	      int result = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " update starbucks_Member set password = ? " + 
	                   	  " where userid = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, Sha256.encrypt(password)); // 암호를 SHA256 알고리즘으로 단방향암호화 시킨다.
	         pstmt.setString(2, userid);
	         
	         result = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return result;
	   } 
	
	// 비밀번호 변경
	@Override
	public int updatePasswd(String userid, String newPassword) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update starbucks_member set password = ? where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Sha256.encrypt(newPassword));
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}
	
	
	
	// 개인정보 수정
	@Override
	public int updateInfo(MemberVO membervo) throws SQLException {
		
		int result=0;
	      
	      try {
	         
	         conn = ds.getConnection();
	         
	         String sql = " update starbucks_member set name=?, hp2=?, hp3=?, email=? "
	                  	 +" where userid = ? ";               
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, membervo.getName());
	         pstmt.setString(2, membervo.getHp2());    
	         pstmt.setString(3, membervo.getHp3());    
	         pstmt.setString(4, aes.encrypt(membervo.getEmail()));
	         pstmt.setString(5, membervo.getUserid());
	              
	         result = pstmt.executeUpdate();      
	         
	         System.out.println("정보수정:"+result);
	         
	      } catch(Exception e){
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	                        
	      return result;   
	}

	
	
	// 나의 음료 삭제하는 메소드
	public int menuDelete(String my_menu_seq) throws SQLException {
		
		int result = 0 ;
		
		try {
		
			conn = ds.getConnection();
			
			String sql = " delete from favorite_menu where my_menu_seq = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(my_menu_seq));
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}
	
	
	// 회원 탈퇴
	@Override
	public int deleteMember(MemberVO membervo) throws SQLException {
		  
		  int result=0;
	      
	      try {
	         
	         conn = ds.getConnection();
	         
	         String sql = " update starbucks_member set status='0' "
	                  	 +" where userid = ? ";               
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, membervo.getUserid());
	         
	         result = pstmt.executeUpdate();      
	         
	      } catch(Exception e){
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	                        
	      return result;   
	
	}

	@Override
	public int checkPoints(HashMap<String, String> paramap) throws SQLException {
		int points = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " select point from starbucks_member where userid = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paramap.get("userid"));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				points = rs.getInt("point");
			}
			
		} finally {
			close();
		}
		
		return points;
	}
}
