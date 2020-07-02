package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class MyinfoEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String name = request.getParameter("name");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		String email = request.getParameter("email");
		String userid = request.getParameter("userid");
		
		MemberVO membervo = new MemberVO();
		membervo.setName(name);
		membervo.setHp2(hp2);
		membervo.setHp3(hp3);
		membervo.setEmail(email);
		membervo.setUserid(userid);
		
		InterMemberDAO memberdao = new MemberDAO();
		int n = memberdao.updateInfo(membervo);
		
		String message = "";
		String loc = "";
		
		if(n==1) {
			message = "정보수정 성공";      
            
            HttpSession session = request.getSession();
            MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
            
            loginuser.setName(name);
            loginuser.setEmail(email);
            loginuser.setHp2(hp2);
            loginuser.setHp3(hp3);
            loginuser.setEmail(email);

            session.setAttribute("loginuser", loginuser);
            
         }
         else {
            message = "회원정보 수정 실패!!";
         }
         
		 loc = "/StarbucksWeb/member/myPage.sb";
		 
         request.setAttribute("message", message);
         request.setAttribute("loc", loc);

         super.setRedirect(false);
         super.setViewPage("/WEB-INF/msg.jsp");
         
        
	}

}
