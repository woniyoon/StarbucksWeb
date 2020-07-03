package feedback.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import feedback.model.FeedbackDAO;
import feedback.model.InterFeedbackDAO;
import notice.model.InterNoticeDAO;
import notice.model.NoticeDAO;

public class FeedbackDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
			String feedback_board_seq = request.getParameter("feedback_board_seq");
			
			InterFeedbackDAO dao = new FeedbackDAO();
			
			int n = dao.delFeedback(feedback_board_seq);
			
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("n", n); 
			
			String json = jsobj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
				
				
	
		} // end of else { POST 방식이라면 }---------------
		
	

	

}
