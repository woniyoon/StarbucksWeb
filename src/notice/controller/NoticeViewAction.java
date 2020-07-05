package notice.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import notice.model.InterNoticeDAO;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class NoticeViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String notice_seq = request.getParameter("notice_seq"); // 공지사항 글번호
		
		System.out.println(notice_seq);
		
		String rno = request.getParameter("rno");
		
		InterNoticeDAO dao = new NoticeDAO();
				
		HashMap<String, String> map = dao.selectOneNotice(notice_seq); // 한개만 불러오는 메소드 생성

		if(map == null) {
			// 사용자가 웹 브라우저에 존재하지 않는 공지사항 글 번호를 입력한 경우
			String message="검색하신 제품은 존재하지 않습니다.";
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
			request.setAttribute("notice_seq", notice_seq);
			request.setAttribute("rno", rno);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/notice/noticeView.jsp");
			
		}

		
		
	}

}
