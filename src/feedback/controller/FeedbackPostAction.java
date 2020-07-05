package feedback.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import feedback.model.FeedbackDAO;
import feedback.model.InterFeedbackDAO;
import member.model.MemberVO;

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

		         MultipartRequest mtrequest = null;
		     
		         
		         // 1. 첨부되어진 파일을 디스크의 어느경로에 업로드 할 것인지 그 경로를 설정해야 한다.
		         HttpSession sesssion = request.getSession();
		         
		         ServletContext svlCtx = sesssion.getServletContext();
		         String imagesDir = svlCtx.getRealPath("/images/hyejeong");
		         
		         System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 imagesDir ==> " + imagesDir); 
		         // imagesDir ==> C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\StarbucksWeb\images\hyejeong
		         
		   
		        try {   
		           //  === 파일을 업로드 해준다.  ===
		           mtrequest = new MultipartRequest(request, imagesDir, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
		         
		         } catch(IOException e) {
		            request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 5MB를 초과했으므로 파일업로드 실패함!!");
		            request.setAttribute("loc", request.getContextPath()+"/feedback/feedbackWrite.up"); 
		            
		            super.setViewPage("/WEB-INF/msg.jsp");
		            return;
		        }
		         
	
		        // 업로드되어진 시스템의 첨부파일 이름을 얻어 올때는 
		        // cos.jar 라이브러리에서 제공하는 MultipartRequest 객체의 getFilesystemName("form에서의 첨부파일 name명") 메소드를 사용 한다. 
		        // 이때 업로드 된 파일이 없는 경우에는 null을 반환한다.   
		        
		        HttpSession session = request.getSession();
		        String file_attached = mtrequest.getFilesystemName("file_attached");
		        String file_attached2 = mtrequest.getFilesystemName("file_attached2");

				
					
				String userid = ((MemberVO)session.getAttribute("loginuser")).getUserid();
				String username = ((MemberVO)session.getAttribute("loginuser")).getName();
				String category = mtrequest.getParameter("category");
				String hp1 = mtrequest.getParameter("hp1");
				String hp2 = mtrequest.getParameter("hp2");
				String hp3 = mtrequest.getParameter("hp3");
				String store_id = mtrequest.getParameter("store_id");
				String visit_day = mtrequest.getParameter("visit_day");
				String title = mtrequest.getParameter("title");
				String contents = mtrequest.getParameter("contents");
				
				
			
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

	


