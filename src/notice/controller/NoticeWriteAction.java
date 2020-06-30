package notice.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import notice.model.*;

public class NoticeWriteAction extends AbstractController {
	
	// !!! === 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성해주는 메소드 생성하기 ===
	private String replaceParameter(String param) {
		
		String result = param;
		
		if(param != null) {
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
		}
		
		return result;
		
	}// end of private String replaceParameter(String param)

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod();
		
		if ( !"POST".equalsIgnoreCase(method)) {
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/notice/noticeWrite.jsp");
		}
		else {
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			contents = this.replaceParameter(contents);
			
			contents = contents.replaceAll("\r\n", "</br>");
			
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", title);
			map.put("contents", contents);
		    			
			InterNoticeDAO dao = new NoticeDAO();
			int n = dao.noticeWrite(map);
			
			String message = "";
			String loc = "";
			
			if(n==1) {
				message = "글쓰기 성공!!";
				loc = "noticeList.sb";
			}
			else {
				message = "글쓰기 실패!!";
				loc = "javascript:history.back()";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
			
	}

}
