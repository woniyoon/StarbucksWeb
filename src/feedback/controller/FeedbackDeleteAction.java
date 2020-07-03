package feedback.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import feedback.model.FeedbackDAO;
import feedback.model.InterFeedbackDAO;

public class FeedbackDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		
		if(!"POST".equalsIgnoreCase(method)) {
			// GET 방식이라면
			
			String message = "비정상적인 경로로 들어왔습니다";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}
		
		else if("POST".equalsIgnoreCase(method) && super.checkLogin(request)) {
			// POST 방식이고 로그인을 했다라면
			
			String feedback_board_seq = request.getParameter("feedback_board_seq");
	
			InterFeedbackDAO pdao = new FeedbackDAO();
			
			// 장바구니 테이블에서 특정제품을 장바구니에서 비우기 
			int n = pdao.delFeedback(feedback_board_seq);
			
			JSONObject jsobj = new JSONObject();
			jsobj.put("n", n);
			
			String json = jsobj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonResult.jsp");
				
				
	
		} // end of else { POST 방식이라면 }---------------
		
	}

	

}
