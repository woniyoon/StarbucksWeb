package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
						
	    	String userid = request.getParameter("userid");
	    	String name = request.getParameter("name");
	    	int gender = Integer.parseInt(request.getParameter("gender"));
	  /*  	
	    	String Birthyyyy = request.getParameter("Birthyyyy");
	    	String Birthmm = request.getParameter("Birthmm");
	    	String Birthdd = request.getParameter("Birthdd");
	   */ 	
	    	String hp1 = request.getParameter("hp1");
	    	String hp2 = request.getParameter("hp2");
	    	String hp3 = request.getParameter("hp3");
	    	
	    	String email = request.getParameter("email");
	    	
	    	request.setAttribute("userid", userid);
	    	request.setAttribute("name", name);
	    	request.setAttribute("gender", gender);
	    	
	    	request.setAttribute("hp2", hp2);
	    	request.setAttribute("hp3", hp3);
	   // 	request.setAttribute("Birthyyyy", Birthyyyy);
	   // 	request.setAttribute("Birthmm", Birthmm);
	   // 	request.setAttribute("Birthdd", Birthdd);
	    	
	    	request.setAttribute("email", email);
	    	
	    //	super.setRedirect(false);
	    	super.setViewPage("/WEB-INF/member/myinfoEdit.jsp");	    	
			
			MemberVO membervo = new MemberVO();
			membervo.setUserid(userid);
			membervo.setName(name);
			membervo.setGender(gender);
			
		//	membervo.setBirthyyyy(Birthyyyy);
		//	membervo.setBirthmm(Birthmm);
		//	membervo.setBirthdd(Birthdd);
			

			membervo.setHp1(hp1);
			membervo.setHp1(hp2);
			membervo.setHp1(hp3);
			
			membervo.setEmail(email);
						
	     }
	}

}
