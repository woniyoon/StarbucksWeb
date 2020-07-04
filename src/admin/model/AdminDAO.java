package admin.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import member.model.*;
import util.security.AES256;

public class AdminDAO implements InterAdminDAO {

	private DataSource ds; 	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes = null;
	
	// 생성자 
	public AdminDAO() {
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

	
	@Override
	public List<MemberVO> getAllMembers(HashMap<String, String> paraMap) throws SQLException {
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		try {
			conn = ds.getConnection();
//			String sql = " select rownum, member_seq, userid, name, email, "
//						+ " hp1, hp2, hp3, point, gender, "
//						+ " substr(Birthday,1,4) AS Birthyyyy, "
//						+ " substr(Birthday,5,2) AS Birthmm, "
//						+ " substr(Birthday, 7) AS Birthdd, "
//						+ " register_day, status "
//						+ " from STARBUCKS_MEMBER "
//						+ " order by " + filterCondition
//						+ " ";
//			
//			 
//			String sql = " select * from "+
//					" (select rownum as rn, member_seq, userid, name, email,  hp1, hp2, hp3 "+
//					"     , point, gender,  substr(Birthday,1,4) AS Birthyyyy "+
//					"     , substr(Birthday,5,2) AS Birthmm, substr(Birthday, 7) AS Birthdd "+
//					"     , register_day, status  "+
//					" from STARBUCKS_MEMBER "+
//					" where userid != 'admin'" +
//					" order by " + paraMap.get("filterCondition") +") m "+
//					" where m.rn between ? and ? ";
			
//			String sql = " select * from "+
//						" (select rownum as rn, member_seq, userid, name, email,  hp1, hp2, hp3 "+
//						"     , point, gender,  substr(Birthday,1,4) AS Birthyyyy "+
//						"     , substr(Birthday,5,2) AS Birthmm, substr(Birthday, 7) AS Birthdd "+
//						"     , register_day, status "+
//						" from STARBUCKS_MEMBER "+
//						" where userid != 'admin' "+
//						" order by "+ paraMap.get("filterCondition") +") m ) t"+
//						" where m.rn between ? and ? ";
			
			String sql = " select * from "+
					"( select rownum as rn, member_seq, userid, name, email,  hp1, hp2, hp3 "+
					"     , point, gender, Birthyyyy "+
					"     , Birthmm, Birthdd "+
					"     , register_day, status "+
					" from\n"+
					" (select rownum, member_seq, userid, name, email,  hp1, hp2, hp3 "+
					"     , point, gender,  substr(Birthday,1,4) AS Birthyyyy "+
					"     , substr(Birthday,5,2) AS Birthmm, substr(Birthday, 7) AS Birthdd "+
					"     , register_day, status  \n"+
					" from STARBUCKS_MEMBER "+
					" where userid != 'admin' "+
					" order by "+ paraMap.get("filterCondition") +") m ) t"+
					" where t.rn between ? and ? ";
				
			
			int memsPerPage = Integer.parseInt(paraMap.get("memsPerPage"));
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			
			System.out.println("sql : "+sql);
			
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, filterCondition);
			pstmt.setInt(1, (currentShowPageNo*memsPerPage)-memsPerPage+1);
			pstmt.setInt(2, (currentShowPageNo)*memsPerPage);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
				
				mvo.setMember_seq(rs.getInt("member_seq"));
				mvo.setUserid(rs.getString("userid"));
				mvo.setName(rs.getString("name"));
				mvo.setEmail(aes.decrypt(rs.getString("email")));
				mvo.setHp1(rs.getString("hp1"));
				mvo.setHp2(rs.getString("hp2"));
				mvo.setHp3(rs.getString("hp3"));
				mvo.setPoint(rs.getInt("point"));
			    mvo.setGender(rs.getInt("gender"));
			    mvo.setBirthyyyy(rs.getString("Birthyyyy"));
			    mvo.setBirthmm(rs.getString("Birthmm"));
			    mvo.setBirthdd(rs.getString("Birthdd"));
			    mvo.setRegisterday(rs.getString("register_day"));
			    mvo.setStatus(rs.getInt("status"));

			    System.out.println("유저아이디 : "+ mvo.getUserid());
			    memberList.add(mvo);
			}
			
		} catch(UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return memberList;
	}

	@Override
	public int getNumOfMems() throws SQLException {
		int numOfMems = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) from STARBUCKS_MEMBER ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				numOfMems = rs.getInt(1);
			}
			
		} finally {
			close();
		}
		
		return numOfMems;
	}

}
