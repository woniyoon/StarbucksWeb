package feedback.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import feedback.model.FeedbackDAO;
import feedback.model.InterFeedbackDAO;

public class FeedbackUpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String feedback_board_seq = request.getParameter("feedback_board_seq"); 
		InterFeedbackDAO dao = new FeedbackDAO();
		
		HashMap<String, String> map = dao.updateOneFeedback(feedback_board_seq); // 한개만 불러오는 메소드 생성
		
		request.setAttribute("map", map);
		
//		super.setRedirect(false);
		super.setViewPage("/WEB-INF/feedback/feedbackEdit.jsp");

	}

}
