package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class MyinfoEditAction extends AbstractController { 

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
						

	    	HttpSession session = request.getSession();
	    	
	    	MemberVO membervo = (MemberVO) session.getAttribute("loginuser");

	    	
	    	request.setAttribute("userid", membervo.getUserid());
	    	request.setAttribute("name", membervo.getName());
	    	request.setAttribute("gender", membervo.getGender());
	    	
	    	request.setAttribute("hp2", membervo.getHp2());
	    	request.setAttribute("hp3", membervo.getHp3());
	    	request.setAttribute("Birthyyyy", membervo.getBirthyyyy());
	    	request.setAttribute("Birthmm", membervo.getBirthmm());
	    	request.setAttribute("Birthdd", membervo.getBirthdd());
	    	request.setAttribute("email", membervo.getEmail());
						
	    	super.setViewPage("/WEB-INF/member/myinfoEdit.jsp");	    	
	     }
	}

}
