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
		
		
		 String method = request.getMethod();
	  
		 // System.out.println(method);
		 
	     if (!"POST".equalsIgnoreCase(method)) {
	         
	    	 String message = "비정상적인 경로를 통해 들어왔습니다!!";
	         String loc = "javascript:history.back()";

	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	         super.setViewPage("/WEB-INF/msg.jsp");
	         return;
	      }
		
	     else {
						
	    	String userid = request.getParameter("userid");
	    	String password = request.getParameter("password");
	    //	System.out.println("####### 확인용 : " + userid);
		
	    /*	
	    	String password = request.getParameter("password");
			
			MemberVO membervo = new MemberVO();
			membervo.setUserid(userid);
			membervo.setPassword(password);
			
			InterMemberDAO memberdao = new MemberDAO();
			int n = memberdao.updatePassword(userid, password);
			
			String message = "";
			
			if (n==1) {
				
				
				message = "비밀번호 변경 성공 !!!";
				HttpSession session = request.getSession(); 
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				
				loginuser.setUserid(userid);
				
				session.setAttribute("loginuser", loginuser);
				
			}
			else {
				message = "비밀번호 변경 안됨";
			}
			
			String loc = "javascript:history.back()";

			
			request.setAttribute("mesaage", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/member/msg.jsp");
		*/
	    	
	    	request.setAttribute("userid", userid);
	    	request.setAttribute("password", password);
	    //	super.setRedirect(false);
			super.setViewPage("/WEB-INF/member/myinfoEditPwd.jsp");
	    	
		} 
	
		
	}

}
