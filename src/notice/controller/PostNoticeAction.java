package notice.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import notice.model.InterNoticeDAO;
import notice.model.NoticeDAO;

public class PostNoticeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rno = request.getParameter("rno");
		System.out.println("나와라 rno : " +rno);
		String notice_seq = request.getParameter("notice_seq");
		System.out.println("나와라 notice_seq : " + notice_seq);
		
		InterNoticeDAO dao = new NoticeDAO();
		
		HashMap<String, String> map = dao.selectPostNotice(notice_seq); // 윗글 불러오기
		// HashMap<String, String> postTitlemap = dao.selectPostNoticeTitle(rno); // 윗글 제목보기
		// HashMap<String, String> preTitlemap = dao.selectPreNoticeTitle(rno); // 윗글 제목보기
		
		// HashMap<String, String> dao.selectPostPreTitle(se)
		
		if(map == null) {
			// 사용자가 웹 브라우저에 존재하지 않는 공지사항 글 번호를 입력한 경우
			String message="검색하신 글은 존재하지 않습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		else {
			// 공지사항글이 있는 경우
			
			request.setAttribute("map", map);
			request.setAttribute("rno", rno);
			request.setAttribute("notice_seq", notice_seq);
			// request.setAttribute("postTitlemap", postTitlemap);
			// request.setAttribute("preTitlemap", preTitlemap);
		//	System.out.println("나와라"+titlemap);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/notice/noticeView.jsp");
			
		}
		
		
	}

}
