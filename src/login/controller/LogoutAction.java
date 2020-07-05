package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LogoutAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 로그아웃
		HttpSession session = request.getSession();
		session.invalidate();
		
		super.setRedirect(true); 
		super.setViewPage(request.getContextPath() + "/index.sb"); // 시작 페이지로 넘어간다.

	}

}
