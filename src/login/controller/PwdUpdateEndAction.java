package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class PwdUpdateEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		//  "GET" or "POST" 
		
		String userid = request.getParameter("userid");
		if("GET".equalsIgnoreCase(method)) {
			
			request.setAttribute("method", method);
			request.setAttribute("userid", userid);
			
			System.out.println("%%%%%%%%%%%%%%%%%%%%%% GET 메소드 PwdUpdateEndAction");
			//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/login/pwdUpdateEnd.jsp");
			
		} else if("POST".equalsIgnoreCase(method)) {
			String password = request.getParameter("password");
			String message = "";
			String loc = "";
			
			InterMemberDAO memberdao = new MemberDAO();
			int n = memberdao.pwdUpdate(password, userid);
			
			System.out.println("userid : "+userid);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%% POST 메소드 PwdUpdateEndAction");

			System.out.println(n);
			request.setAttribute("n", n);
			
			if(n == 1) {
				message = "성공!";
				loc = request.getContextPath()+"/login/loginIndex.sb";
			} else {
				message = "실패!";
				loc = request.getContextPath()+"/login/loginIndex.sb";
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		

	}

}
