package notice.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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

	
	// 페이징 처리를 한 모든 글 정보 조회해주기
	@Override
	public List<NoticeVO> selectOneNotice(HashMap<String, String> paraMap) throws SQLException {
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		
		try {
			conn = ds.getConnection();
						
			String sql = "select (select count(*) from notice_post) - rowno + 1 AS RNO, notice_seq, title, write_day, hit "+
					"from  "+
					" ( "+
					"   select rownum AS ROWNO, notice_seq, title, write_day , hit "+
					"   from  "+
					"   ( "+
					"    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit "+
					"    from notice_post ";
			
			String searchWord = paraMap.get("searchWord");
			
			if (searchWord != null && !searchWord.trim().isEmpty()) {
				sql += " where title like '%' || ? || '%' ";
			}
	
			sql +=  "    order by notice_seq desc "+
					"   ) V "+
					" ) T "+
					"where T.ROWNO between ? and ?";
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			
			if (searchWord != null && !searchWord.trim().isEmpty()) { // 검색어가 있는 경우
				pstmt.setString(1, searchWord);	
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage -1 ) );// 공식
				pstmt.setInt(3, (currentShowPageNo * sizePerPage) );// 공식
			}
			
			else { // 검색어가 없는 경우
				pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage -1 ) );// 공식
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) );// 공식
			}
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO nvo = new NoticeVO();
				nvo.setRno(rs.getInt("RNO"));
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
	
	// 페이징 처리를 위한 전체회원에 대한 총 페이지개수 알아오기(select)
	@Override
	public int getTotalPage(HashMap<String, String> paraMap) throws SQLException {

		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/10) AS totalPage " +
						 " from notice_post ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt("totalPage");
			
		} finally {
			close();
		}
		
		return totalPage;
	}

	// store_location 테이블에 있는 정보 가져오기
	@Override
	public List<HashMap<String, String>> selectStoreMap() throws SQLException {

		List<HashMap<String, String>> storeList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select store_id, store_sequence, store_name, address, url, latitude, longitude, zindex "+
						 " from store_location	"+
						 " order by zindex asc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, String> map = new HashMap<>();
				map.put("STORE_ID", rs.getString("STORE_ID"));
				map.put("STORE_SEQUENCE", rs.getString("STORE_SEQUENCE"));
				map.put("STORE_NAME", rs.getString("STORE_NAME"));
				map.put("ADDRESS", rs.getString("ADDRESS"));
				map.put("URL", rs.getString("URL"));
				map.put("LATITUDE", rs.getString("LATITUDE"));
				map.put("LONGITUDE", rs.getString("LONGITUDE"));
				map.put("ZINDEX", rs.getString("ZINDEX"));
								
				storeList.add(map); 
			}
			
		} finally {
			close();
		}
		
		return storeList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}



















