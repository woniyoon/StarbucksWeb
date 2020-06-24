package notice.model;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

import java.sql.SQLException;

public class NoticeDAO implements InterNoticeDAO {

	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public NoticeDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null)    {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	// 공지사항 글쓰기 메소드 생성하기
	@Override
	public int noticeWrite(HashMap<String, String> map) throws SQLException {

		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			//////////////////////////////////////////////////////////////////////
			String sql = " insert into notice_post (notice_seq, title, contents, write_day)  "
			    + " values(seq_notice_post.nextval, ?, ?, default) ";
			
//			insert into notice_post (notice_seq, post_no, title, contents, write_day)
//		    values (seq_notice_post.nextval, 1, '공지1', '공지 내용 1', default); 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("title"));
			pstmt.setString(2, map.get("contents"));
			
			n = pstmt.executeUpdate();
			
		} finally {
			close(); // 사용한 자원 반납
		}

		return n;
	} // end of public void noticeWrite(HashMap<String, String> map) ---------------------

	
	// 공지사항 글목록 불러오기 -----------------------------------------------------
	@Override
	public List<NoticeVO> noticeTitleList() throws SQLException {
		
		List<NoticeVO> noticeList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			//////////////////////////////////////////////////////////////////////
			String sql = " select rno, notice_seq, title, write_day, hit " + 
					" from  " + 
					" ( " + 
					"   select rownum AS RNO, notice_seq, title, write_day , hit " + 
					"   from  " + 
					"   ( " + 
					"    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit " + 
					"    from notice_post " + 
					"    order by 1 asc " + 
					"   ) V " + 
					"  ) T " + 
					"  order by T.rno desc ";

			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				NoticeVO nvo = new NoticeVO();
				nvo.setRno(rs.getInt("rno"));
				nvo.setNotice_seq(rs.getInt("notice_seq"));
				nvo.setTitle(rs.getString("title"));
				nvo.setWrite_day(rs.getString("write_day"));
				nvo.setHit(rs.getInt("hit"));
				
				noticeList.add(nvo);
			}
		} finally {
			close();
		}

		return noticeList;
	}

	// 글번호를 가지고 특정 게시글 조회하기
	@Override
	public HashMap<String, String> selectOneNotice(String notice_seq) throws SQLException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		try {
			conn = ds.getConnection();			
			
			String sql = " update notice_post set hit = hit + 1 "
					   + " where to_char(notice_seq) = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice_seq);
			
			pstmt.executeUpdate();
			
			sql = " select title, contents "+
				  " from notice_post "+
				  " where to_char(notice_seq) = ? "; // SQL문 오류 방지를 위해 문자열로 바꿔준다.	
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice_seq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				map.put("title", rs.getString("title"));
				map.put("contents", rs.getString("contents"));
			}
	
		} finally {
			close();
		}
		
		return map;
		
	} // end of public NoticeVO selectOneNotice(String notice_seq)

}



















