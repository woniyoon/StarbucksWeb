package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import notice.model.*;

public class NoticeDelAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String notice_seq = request.getParameter("notice_seq");
		
		InterNoticeDAO dao = new NoticeDAO();
		
		int n = dao.delNotice(notice_seq);
		
		JSONObject jsobj = new JSONObject();
		
		jsobj.put("n", n); 
		
		String json = jsobj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
		
		
		
		
	}

}
