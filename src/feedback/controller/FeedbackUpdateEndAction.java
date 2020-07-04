package feedback.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import feedback.model.FeedbackDAO;
import feedback.model.FeedbackListVO;
import feedback.model.InterFeedbackDAO;

public class FeedbackUpdateEndAction extends AbstractController {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// *** POST 방식으로 넘어온 것이 아니라면 *** //
		String method = request.getMethod();

		String feedback_board_seq = request.getParameter("feedback_board_seq");

		
		if(!"POST".equalsIgnoreCase(method)) {

			String message = "비정상적인 경로를 통해 들어왔습니다!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
	
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		else {
			
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", title);
			map.put("contents", contents);
			System.out.println(title+ " 피드백업데이트앤드액션 ");
			System.out.println(contents + " 피드백업데이트앤드액션 ");
		    			
			InterFeedbackDAO dao = new FeedbackDAO();
			int n = dao.feedbackEdit(feedback_board_seq,map);
			System.out.println(feedback_board_seq);
			String message = "";
			String loc = "";
			
			if(n==1) {
				
				message= "문의내역을 수정하였습니다.";
				loc = "/StarbucksWeb/feedback/feedbackView.sb?feedback_board_seq="+feedback_board_seq;
				// session 에 저장된 loginuser 를 변경된 사용자의 정보값으로 변경해주어야 한다.
				HttpSession session = request.getSession();
				
				
				
				session.setAttribute("title", title);
				session.setAttribute("contents", contents);
			}
			else {
				message = "문의내역 수정을 실패하였습니다";
				loc = "javascript:history.back()";
				
				//	super.setRedirect(false);
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}
		

	}

}
