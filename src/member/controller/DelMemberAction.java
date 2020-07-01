package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class DelMemberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userid = request.getParameter("userid");
		
	//	System.out.println("##### 확인용: "+userid);
		
		MemberVO membervo = new MemberVO();
		membervo.setUserid(userid);
		
		InterMemberDAO mdao = new MemberDAO();
		int n  = mdao.deleteMember(membervo);
		
	//	System.out.println("성공했으면 1인데 .. "+n);
		
		String message = "";
		String loc = "";
		
		if(n==1) {
			message = "탈퇴 완료";      
            
            HttpSession session = request.getSession();
            MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
            
            session.setAttribute("loginuser", loginuser);

		}
         else {
            message = "탈퇴 실패";
            loc = "javascript:history.back()";
         }
         
		 loc = "http://localhost:9090/StarbucksWeb/login/loginIndex.sb";
		
		 request.setAttribute("message", message);
         request.setAttribute("loc", loc);

         super.setRedirect(false);
         super.setViewPage("/WEB-INF/msg.jsp");
	}

}
