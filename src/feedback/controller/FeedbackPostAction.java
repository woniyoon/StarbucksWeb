package feedback.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import feedback.model.FeedbackDAO;
import feedback.model.InterFeedbackDAO;
import member.model.MemberVO;
import notice.model.InterNoticeDAO;
import notice.model.NoticeDAO;

public class FeedbackPostAction extends AbstractController {


		// !!! === 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성해주는 메소드 생성하기 ===
		private String replaceParameter(String param) {
			
			String result = param;
			
			if(param != null) {
				result = result.replaceAll("<", "&lt;");
				result = result.replaceAll(">", "&gt;");
			}
			
			return result;
			
		}// end of private String replaceParameter(String param)

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			String method = request.getMethod();
			
			if ( !"POST".equalsIgnoreCase(method)) {
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/feedback/feedbackWrite.jsp");
			}
			else {
				
				boolean isLogin = super.checkLogin(request);
				
				HttpSession session = request.getSession();
				
					
					String userid = ((MemberVO)session.getAttribute("loginuser")).getUserid();
					String username = ((MemberVO)session.getAttribute("loginuser")).getName();
					String category = request.getParameter("category");
					String hp1 = request.getParameter("hp1");
					String hp2 = request.getParameter("hp2");
					String hp3 = request.getParameter("hp3");
					String store_id = request.getParameter("store_id");
					String visit_day = request.getParameter("visit_day");
					String title = request.getParameter("title");
					String contents = request.getParameter("contents");
					String file_attached = request.getParameter("file_attached");
					String file_attached2 = request.getParameter("file_attached2");
					
					contents = this.replaceParameter(contents);
					
					contents = contents.replaceAll("\r\n", "</br>");
					
					
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("userid", userid);
					map.put("username", username);
					map.put("category", category);
					map.put("hp1", hp1);
					map.put("hp2", hp2);
					map.put("hp3", hp3);
					map.put("store_id", store_id);
					map.put("visit_day", visit_day);
					map.put("title", title);
					map.put("contents", contents);
					map.put("file_attached", file_attached);
					map.put("file_attached2", file_attached2);
				    			
					InterFeedbackDAO dao = new FeedbackDAO();
					int n = dao.feedbackPost(map);
					
					String message = "";
					String loc = "";
					
					if(n==1) {
						message = "글쓰기 성공!!";
						loc = "feedbackList.sb";
					}
					else {
						message = "글쓰기 실패!!";
						loc = "javascript:history.back()";
					}
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					
				}

			}
				
		}

	


