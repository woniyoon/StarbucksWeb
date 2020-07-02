package feedback.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class FeedbackWriteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


			// === 로그인 유무 검사하기 === //
			boolean isLogin = super.checkLogin(request);
			
			HttpSession session = request.getSession();
			
			if(!isLogin) { // 로그인을 하지 않은 상태라면
				/*
				   사용자가 로그인을 하지 않은 상태에서 특정제품을 장바구니에 담고자 하는 경우 
				   사용자가 로그인을 하면 장바구니에 담고자 했던 그 특정제품 페이지로 이동하도록 해야 한다.
				*/
				String goBackURL = request.getParameter("goBackURL");
				
				session.setAttribute("goBackURL", goBackURL);
				
				request.setAttribute("message", "먼저 로그인 부터 하세요!!");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/msg.jsp");
				return;

			}
			else {
				
				
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/feedback/feedbackWrite.jsp");

	}

}

}