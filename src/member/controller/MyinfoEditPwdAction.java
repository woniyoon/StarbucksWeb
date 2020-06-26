package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MyinfoEditPwdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String message = "";
		
	     if(!super.checkLogin(request)) {
	    	 
	    	 message = "로그인 먼저하세요!";

	    	 String loc = "javascript:history.back()";
	    	 
	    	 request.setAttribute("message", message);
	    	 request.setAttribute("loc", loc);
	    	 
	    	 super.setViewPage("/WEB-INF/msg.jsp");
	    	 return;
	     }
		
	     else {
						
	    	String userid = request.getParameter("userid");
	    	String password = request.getParameter("password");
	    	
	    	request.setAttribute("userid", userid);
	    	request.setAttribute("password", password);
	    //	super.setRedirect(false);
			super.setViewPage("/WEB-INF/member/myinfoEditPwd.jsp");
	    	
			
			MemberVO membervo = new MemberVO();
			membervo.setUserid(userid);
			membervo.setPassword(password);
			
		//	System.out.println(userid);
	     }
	     
	     
	}

}
