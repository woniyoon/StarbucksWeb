package feedback.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

import feedback.model.InterFeedbackDAO;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;
import util.security.Sha256;
import feedback.model.FeedbackListVO;

public class FeedbackDAO implements InterFeedbackDAO{
	
	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public FeedbackDAO() {
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

		// 고객의소리 글쓰기 메소드 생성하기
		@Override
		public int feedbackPost(HashMap<String, String> map) throws SQLException {

			int n = 0;
			
			try {
				conn = ds.getConnection();
				
				//////////////////////////////////////////////////////////////////////
				String sql = "insert into feedback_post (feedback_board_seq, category, hp1, hp2, hp3, store_id, visit_day, title, contents, file_attached, file_attached2, userid, hit, username, write_day, status) "+
						     "values (feedback_board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, ?, sysdate, default)";
				
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, map.get("category"));
				pstmt.setString(2, map.get("hp1"));
				pstmt.setString(3, map.get("hp2"));
				pstmt.setString(4, map.get("hp3"));
				pstmt.setString(5, map.get("store_id"));
				pstmt.setString(6, map.get("visit_day"));
				pstmt.setString(7, map.get("title"));
				pstmt.setString(8, map.get("contents"));
				pstmt.setString(9, map.get("file_attached"));
				pstmt.setString(10, map.get("file_attached2"));
				pstmt.setString(11, map.get("userid"));
				pstmt.setString(12, map.get("username"));
				
				
				
				n = pstmt.executeUpdate();
				
			} finally {
				close(); // 사용한 자원 반납
			}

			return n;
		} // end of public void noticeWrite(HashMap<String, String> map) ---------------------

		
		
		// 고객의소리 글목록 불러오기 -----------------------------------------------------
		@Override
		public List<FeedbackListVO> feedbackTitleList() throws SQLException {
			
			List<FeedbackListVO> feedbackList = new ArrayList<>();
			
			try {
				
				conn = ds.getConnection();
				
				//////////////////////////////////////////////////////////////////////
				String sql = " select rno, feedback_board_seq, title, write_day, hit " + 
							 " from  " + 
							 " ( " + 
							 "   select rownum AS RNO, feedback_board_seq, title, write_day , hit " + 
							 "   from  " + 
							 "   ( " + 
							 "    select feedback_board_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit " + 
							 "    from feedback_post " + 
							 "    order by 1 asc " + 
							 "   ) V " + 
							 "  ) T " + 
							 "  order by T.rno desc ";
							 

				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery(sql);
				
				while(rs.next()) {
					FeedbackListVO fvo = new FeedbackListVO();
					fvo.setRno(rs.getInt("rno"));
					fvo.setFeedback_board_seq(rs.getInt("feedback_board_seq"));
					fvo.setTitle(rs.getString("title"));
					fvo.setWrite_day(rs.getString("write_day"));
					fvo.setHit(rs.getInt("hit"));
					
					feedbackList.add(fvo);
				}
			} finally {
				close();
			}

			return feedbackList;
		}

		// 글번호를 가지고 특정 게시글 조회하기
		@Override
		public HashMap<String, String> selectOneFeedback(String feedback_board_seq) throws SQLException {
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			try {
				conn = ds.getConnection();			
				
				String sql = " update feedback_post set hit = hit + 1 "
						   + " where to_char(feedback_board_seq) = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, feedback_board_seq);
				
				pstmt.executeUpdate();
				
				sql = " select category, hp1, hp2, hp3, store_id, visit_day, title, contents, file_attached, file_attached2 "+
					  " from feedback_post "+
					  " where to_char(feedback_board_seq) = ? "; // SQL문 오류 방지를 위해 문자열로 바꿔준다.	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, feedback_board_seq);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					map.put("category", rs.getString("category"));
					map.put("hp1", rs.getString("hp1"));
					map.put("hp2", rs.getString("hp2"));
					map.put("hp3", rs.getString("hp3"));
					map.put("store_id", rs.getString("store_id"));
					map.put("visit_day", rs.getString("visit_day"));
					map.put("title", rs.getString("title"));
					map.put("contents", rs.getString("contents"));
					map.put("file_attached", rs.getString("file_attached"));
					map.put("file_attached2", rs.getString("file_attached2"));
					map.put("feedback_board_seq", feedback_board_seq);
				}
		
			} finally {
				close();
			}
			
			return map;
			
		} // end of public NoticeVO selectOneNotice(String notice_seq)

		
		// 페이징 처리를 한 모든 글 정보 조회해주기
		@Override
		public List<FeedbackListVO> selectOneFeedback(HashMap<String, String> paraMap) throws SQLException {
			List<FeedbackListVO> feedbackList = new ArrayList<FeedbackListVO>();
			
			try {
				conn = ds.getConnection();
							
				String sql = " select (select count(*) from feedback_post) - rowno + 1 AS RNO, feedback_board_seq, status, title, username, write_day, hit " + 
							 " from " + 
							 " ( " + 
							 " select rownum AS ROWNO, feedback_board_seq, status, title, username, write_day, hit " + 
							 " from " + 
							 " ( " + 
							 " select feedback_board_seq, status, title, username, to_char(write_day,'yyyy-mm-dd') AS write_day , hit " + 
							 " from feedback_post ";
				
				String searchWord = paraMap.get("searchWord");
				
				if (searchWord != null && !searchWord.trim().isEmpty()) {
					sql += " where title like '%' || ? || '%' ";
				}
		
				sql +=  "    order by feedback_board_seq desc "+
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
					FeedbackListVO fvo = new FeedbackListVO();
					fvo.setRno(rs.getInt("RNO"));
					fvo.setStatus(rs.getString("status"));
					fvo.setFeedback_board_seq(rs.getInt("feedback_board_seq"));
					fvo.setTitle(rs.getString("title"));
					fvo.setUsername(rs.getString("username"));
					fvo.setWrite_day(rs.getString("write_day"));
					fvo.setHit(rs.getInt("hit"));
					
					feedbackList.add(fvo);
				}
				
			} finally {
				close();
			}
			
			return feedbackList;
		}
		
		
			// 페이징 처리를 한 나의 글 정보 조회해주기
			@Override
			public List<FeedbackListVO> selectMyFeedback(HashMap<String, String> paraMap) throws SQLException {
				List<FeedbackListVO> feedbackList = new ArrayList<FeedbackListVO>();
				
				try {
					conn = ds.getConnection();
								
					String sql = " select (select count(*) from feedback_post) - rowno + 1 AS RNO, feedback_board_seq, status, title, username, write_day, hit " + 
								 " from " + 
								 " ( " + 
								 " select rownum AS ROWNO, feedback_board_seq, status, title, username, write_day, hit " + 
								 " from " + 
								 " ( " + 
								 " select feedback_board_seq, status, title, username, to_char(write_day,'yyyy-mm-dd') AS write_day , hit " + 
								 " from feedback_post " +
								 " where userid = ? ";
					
					
					String searchWord = paraMap.get("searchWord");
					String userid = paraMap.get("userid");
					System.out.println(userid);
					
					
					
					if (searchWord != null && !searchWord.trim().isEmpty()) {
						sql += " where title like '%' || ? || '%' ";
					}
			
					sql +=  "    order by feedback_board_seq desc "+
							"   ) V "+
							" ) T "+
							"where T.ROWNO between ? and ?";
					
					pstmt = conn.prepareStatement(sql);
					
					int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
					int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
					
					
					if (searchWord != null && !searchWord.trim().isEmpty()) { // 검색어가 있는 경우
						pstmt.setString(1, userid);
						pstmt.setString(2, searchWord);	
						pstmt.setInt(3, (currentShowPageNo * sizePerPage) - (sizePerPage -1 ) );// 공식
						pstmt.setInt(4, (currentShowPageNo * sizePerPage) );// 공식
					}
					
					else { // 검색어가 없는 경우
						pstmt.setString(1, userid);
						pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage -1 ) );// 공식
						pstmt.setInt(3, (currentShowPageNo * sizePerPage) );// 공식
					}
					
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						FeedbackListVO fvo = new FeedbackListVO();
						fvo.setRno(rs.getInt("RNO"));
						fvo.setStatus(rs.getString("status"));
						fvo.setFeedback_board_seq(rs.getInt("feedback_board_seq"));
						fvo.setTitle(rs.getString("title"));
						fvo.setUsername(rs.getString("username"));
						fvo.setWrite_day(rs.getString("write_day"));
						fvo.setHit(rs.getInt("hit"));
						
						feedbackList.add(fvo);
					}
					
				} finally {
					close();
				}
				
				return feedbackList;
			}
		
		
		
		
		// 페이징 처리를 위한 전체회원에 대한 총 페이지개수 알아오기(select)
		@Override
		public int getTotalPage(HashMap<String, String> paraMap) throws SQLException {

			int totalPage = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = " select ceil(count(*)/10) AS totalPage " +
							 " from feedback_post ";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				totalPage = rs.getInt("totalPage");
				
			} finally {
				close();
			}
			
			return totalPage;
		}

		
		
		// 나의 문의내역 삭제하기
		@Override
		public int delFeedback(String feedback_board_seq) throws SQLException {
			
			 int n = 0;
             
             try {
                conn = ds.getConnection();
                
                String sql = " delete feedback_post "
                           + " where feedback_board_seq = ? ";
                         
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, feedback_board_seq);
                
                n = pstmt.executeUpdate();
                
             } finally {
                close();
             }
             
             return n;
		}

		
		// 나의 문의내역 수정하기
		@Override
		public int feedbackEdit(String feedback_board_seq, HashMap<String, String> map) throws SQLException {
			
			int result = 0;

		      try {
		          conn = ds.getConnection();
		          
		          String sql = "update feedback_post set title=?, contents=? "       
		                   + " where feedback_board_seq = ? ";
		          
		          pstmt = conn.prepareStatement(sql);
		            
		          pstmt.setString(1, map.get("title"));
		          pstmt.setString(2, map.get("contents"));
		          pstmt.setString(3, feedback_board_seq);

		          result = pstmt.executeUpdate();
		          
		      } finally {
		         close();
		      }
		      
		      return result;
		}
		
		
		// 수정할 글 정보 조회해주기
		@Override
		public HashMap<String, String> updateOneFeedback(String feedback_board_seq) throws SQLException {
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			try {
				conn = ds.getConnection();			
				
				
				String sql = " select category, hp1, hp2, hp3, store_id, visit_day, title, contents, file_attached, file_attached2 "+
					  " from feedback_post "+
					  " where to_char(feedback_board_seq) = ? "; // SQL문 오류 방지를 위해 문자열로 바꿔준다.	
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, feedback_board_seq);
				
				ResultSet rs = pstmt.executeQuery();
				
				System.out.println(rs);
				if(rs.next()) {
					map.put("category", rs.getString("category"));
					map.put("hp1", rs.getString("hp1"));
					map.put("hp2", rs.getString("hp2"));
					map.put("hp3", rs.getString("hp3"));
					map.put("store_id", rs.getString("store_id"));
					map.put("visit_day", rs.getString("visit_day"));
					map.put("title", rs.getString("title"));
					map.put("contents", rs.getString("contents"));
					map.put("file_attached", rs.getString("file_attached"));
					map.put("file_attached2", rs.getString("file_attached2"));
					map.put("feedback_board_seq", feedback_board_seq);
					
					System.out.println("FeedbackDAO에 " +map.get("category"));
				}
		
			} finally {
				close();
			}
			
			return map;
		}

		

		
		
		
		

}
