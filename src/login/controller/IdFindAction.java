package login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;

public class IdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		// "GET" or "POST"
		
		if("POST".equalsIgnoreCase(method)) {

				String name = request.getParameter("name");
				String hp1 = request.getParameter("hp1");
				String hp2 = request.getParameter("hp2");
				String hp3 = request.getParameter("hp3");
				
				InterMemberDAO memberdao = new MemberDAO();
				
				HashMap<String,String> paraMap = new HashMap<String,String>();
				paraMap.put("name", name);
				paraMap.put("hp1", hp1);
				paraMap.put("hp2", hp2);
				paraMap.put("hp3", hp3);
				
				String userid = memberdao.findUserid(paraMap);
				
				if(userid != null) {
					
					request.setAttribute("userid", userid);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/login/idFind.jsp");
				}
				else {
					
					System.out.println(paraMap.get("name")); //주혜정
					System.out.println(paraMap.get("hp1")); // null
					
					String message = "존재하지 않는 사용자 정보입니다. ";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);  // msg.jsp
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
	
			}
			
			request.setAttribute("name", name);
			request.setAttribute("hp1", hp1);
			request.setAttribute("hp2", hp2);
			request.setAttribute("hp3", hp3);

		}
		
		request.setAttribute("method", method);
		
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/login/idFind.jsp");
	}

}
