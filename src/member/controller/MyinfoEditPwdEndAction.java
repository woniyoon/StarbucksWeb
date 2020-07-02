package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;
import util.security.Sha256;

public class MyinfoEditPwdEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		
		InterMemberDAO mdao = new MemberDAO();
		String originalPwd = mdao.selectPasswd(userid);
		
		String message = "";
		String loc = "";
		
		if(Sha256.encrypt(password).equals(originalPwd)) {
			
			int n = mdao.updatePasswd(userid, newPassword);
			
			if(n==1) {
				message = "암호변경 성공";
				loc = "/StarbucksWeb/member/myPage.sb";
			}
			
			} else {
				message = "현재암호 틀림";
				loc = "javascript:history.back()";
			}
	        
			request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	        
	        super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");
        
		
	}

}
