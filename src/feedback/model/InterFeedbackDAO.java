package feedback.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterFeedbackDAO {

		// 고객의소리 글쓰기(포스팅)
		int feedbackPost(HashMap<String, String> map) throws SQLException;

		// 고객의소리 글목록 불러오기
		List<FeedbackListVO> feedbackTitleList() throws SQLException;

		// 글번호를 가지고 특정 게시글 조회하기
		HashMap<String, String> selectOneFeedback(String userid) throws SQLException;

		// 페이징 처리를 한 모든 글 정보 조회해주기 (관리자용)
		List<FeedbackListVO> selectOneFeedback(HashMap<String, String> paraMap) throws SQLException;

		// 페이징 처리를 위한 전체회원에 대한 총 페이지개수 알아오기(select)
		int getTotalPage(HashMap<String, String> paraMap) throws SQLException;

		// 페이징 처리를 한 나의 글 정보 조회해주기 (일반회원용)
		List<FeedbackListVO> selectMyFeedback(HashMap<String, String> paraMap) throws SQLException;

		// 나의 문의내역 삭제하기
		int delFeedback(String feedback_board_seq) throws SQLException;		

		
		


	
}
