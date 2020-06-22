package register.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.*;


public class MemberRegisterAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
        //	super.setRedirect(false);
			super.setViewPage("/WEB-INF/register/memberRegister.jsp");
		}
		
		else {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String birthyyyy = request.getParameter("birthyyyy");
			String birthmm = request.getParameter("birthmm");
			String birthdd = request.getParameter("birthdd");
			
			// *** 클라이언트의 IP 주소 알아오기 *** // 
			/* String clientip = request.getRemoteAddr(); */
			
			MemberVO membervo = new MemberVO();
			membervo.setId(id);
			membervo.setPassword(password);
			membervo.setName(name);
			membervo.setEmail(email);
			membervo.setPhone(phone);
			membervo.setGender(gender);
			membervo.setBirthyyyy(birthyyyy);
			membervo.setBirthmm(birthmm);
			membervo.setBirthdd(birthdd);
			/* membervo.setClientip(clientip); */
			
			InterMemberDAO memberdao = new MemberDAO();
			int n = memberdao.registerMember(membervo);
	
			String message = "";
			String loc = "";
			
			if(n==1) {
				message = "회원가입 성공";
				loc = request.getContextPath()+"/index.sb"; // 시작 페이지
			}
			else {
				message = "회원가입 실패";
				loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는것.
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
