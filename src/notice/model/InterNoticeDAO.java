package notice.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterNoticeDAO {

	// 공지사항 글쓰기
	int noticeWrite(HashMap<String, String> map) throws SQLException;

	// 공지사항 글목록 불러오기
	List<NoticeVO> noticeTitleList() throws SQLException;

	// 글번호를 가지고 특정 게시글 조회하기
	HashMap<String, String> selectOneNotice(String notice_seq) throws SQLException;

	// 페이징 처리를 한 모든 글 정보 조회해주기
	List<NoticeVO> selectOneNotice(HashMap<String, String> paraMap) throws SQLException;

	// 페이징 처리를 위한 전체회원에 대한 총 페이지개수 알아오기(select)
	int getTotalPage(HashMap<String, String> paraMap) throws SQLException;

	// store_location 테이블에 있는 정보 가져오기
	List<HashMap<String, String>> selectStoreMap() throws SQLException;

	

	
	
	
	
}
