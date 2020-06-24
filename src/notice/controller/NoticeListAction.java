package notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import common.controller.AbstractController;
import notice.model.*;

public class NoticeListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		InterNoticeDAO dao = new NoticeDAO();
		List<NoticeVO> noticeList = dao.noticeTitleList();
		
		request.setAttribute("noticeList", noticeList);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/notice/noticeList.jsp");	
	}

}
