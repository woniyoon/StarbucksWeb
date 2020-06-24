package login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class LoginAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String method = request.getMethod();	// "GET" or "POST"

		if(!"POST".equalsIgnoreCase(method)) {
//			super.setRedirect(false);
			super.setViewPage("/WEB-INF/login/login.jsp");
		}

		// POST 방식으로 넘어온 것이라면

		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
	//	System.out.println("~~~~ 확인용 userid : "+userid+", pwd : "+pwd); // get방식으로 url직접 입력했을때도 값이넘어옴. => 방지해야함
		
		HashMap<String,String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("password", password);
		
		InterMemberDAO memberdao = new MemberDAO();
		MemberVO loginuser = memberdao.selectOneMember(paraMap);
		
		if( loginuser != null ) {
			// 로그인 성공시
			
			// 암기!!! ★★★★★
			// 세션(session)이라는 저장 역역에 loginuser 를 저장시켜두면
			// 모든 ~~~Action 클래스 및 모든 JSP 페이지(파일)에서 loginuser 정보를 읽어들일 수 있게 된다. 
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			
		//	String goBackURL = request.getContextPath()+"/index.up";
		//	String goBackURL = (String) session.getAttribute("goBackURL");
			// 평상시에는 goBackURL 은 null 이다.
			// 하지만 로그인을 하지 않은 상태에서 장바구니에 담기를 했을경우에는 goBackURL 은 null 이 아니다. 

			
			/*if( loginuser.isRequirePwdChange() == true && goBackURL == null) {
				String message = "비밀번호를 변경하신지 3개월이 지났습니다. 암호를 변경하세요!! ";
				String loc = request.getContextPath()+"/index.up";
				// 원래는 사용자정보 변경페이지로 이동하도록 loc 를 정해주어야 한다.
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
			
			else if( loginuser.isRequirePwdChange() == true && goBackURL != null) {
				String message = "비밀번호를 변경하신지 3개월이 지났습니다. 암호를 변경하세요!! ";
				String loc = request.getContextPath()+"/"+goBackURL;
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
			
			else if( goBackURL != null) {
				// 암호변경을 한지는 3개월 이내이고 
				// 로그인을 하지 않은 상태에서 장바구니에 담기를 했을경우 
				// 로그인을 한 다음에는 장바구니에 담기를 시도했던 그 특정페이지로 가야 한다.
				
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/"+goBackURL);
				//				/MyMVC/shop/prodView.up?pnum=1
				//				/MyMVC/shop/prodView.up?pnum=2
				//				/MyMVC/shop/prodView.up?pnum=3
				
				// !!! 중요 !!!
				// 세션에서 키값이 "goBackURL" 인 것은 더이상 필요없으므로 세션에서 제거해야 한다.
				session.removeAttribute("goBackURL");

			}
			
			else {
				// 암호변경을 한지는 3개월 이내이고
				// 그냥 로그인을 시도하는 경우
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/index.up");
			}
			
		}
		
		else if( loginuser != null && loginuser.isIdleStatus() == true ) {
			// 로그인을 한지 1년이 지나서 휴면 상태에 빠진 경우
			String message = "로그인을 한지 1년이 지나서 휴면상태로 되었습니다. 관리자에게 문의 바랍니다.";
			String loc = request.getContextPath()+"/index.up";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);  // msg.jsp
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			/// alert 창에서 "확인"을 클릭해주면 휴면계정인 상태를 다시 정삭적으로 사용되어지게끔 해준다.
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			
			memberdao.expireIdle(loginuser.getIdx()); // or getuserid()
			// 휴면상태인 사용자 계정을 휴면이 아닌것으로 해주어야 한다.
			// 즉, lastlogindate 컬럼의 값을 sysdate 로  update 해준다.
			
			return;
		}
		*/
			/* String id = loginuser.getUserid(); */
			String message = loginuser.getUserid()+"님 환영합니다";
			String loc = request.getContextPath()+"/index.sb";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);  // msg.jsp
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		else {
			// 로그인 실패시
			String message = "  로그인에 실패했습니다. \\n " +
							 " 정확한 아이디 또는 비밀번호를 입력해주시길 바랍니다. ";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);  // msg.jsp
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
	
	}

	

	
}