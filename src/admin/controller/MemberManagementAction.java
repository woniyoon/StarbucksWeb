package admin.controller;

import java.util.*;

import javax.servlet.http.*;

import admin.model.*;
import common.controller.AbstractController;
import member.model.MemberVO;

public class MemberManagementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		if(!checkLogin(request)) {
			
			String message = "먼저 로그인 해야 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
			
		} else {
			if(!"admin".equalsIgnoreCase(getLoginUser(request).getUserid())) {
				String message = "잘못된 경로입니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
			
		}	
		
			
		String currentShowPageNo = request.getParameter("currentShowPageNo");			
		String filterCondition = request.getParameter("filterCondition");			
		HashMap<String, String> paraMap = new HashMap<>();
		int sizePerPage = 3;	// 한 페이지에 보여주는 멤버 수;

		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}

		System.out.println("filterCondition    : "  + filterCondition);
		
		if(filterCondition == null) {
			filterCondition = "userid";
		}
		
		
		paraMap.put("currentShowPageNo", currentShowPageNo);
		paraMap.put("filterCondition", filterCondition);
		paraMap.put("memsPerPage", String.valueOf(sizePerPage));

		
		InterAdminDAO dao = new AdminDAO();
		
		List<MemberVO> memberList = dao.getAllMembers(paraMap);

		int numOfMems = dao.getNumOfMems();
		int totalPage = (numOfMems / sizePerPage);
		
		System.out.println("currentPage : " + currentShowPageNo);
		
		if(numOfMems % sizePerPage > 0) {
			totalPage = totalPage + 1;
		}
		
		// 페이지에서 보여지는 첫번째 페이지 번호
		int pageNo = 1;
		// 블럭당 보여지는 페이지 번호의 갯수
		int blockSize = 10;
		// 1부터 증가해 1개 블럭을 이루는 페이지 번호의 갯수(10개)까지만 증가하는 용도
		int loop = 1;
		
		pageNo = ((Integer.parseInt(currentShowPageNo)-1)/blockSize) * blockSize + 1;

		
		String pageBar = "";

		
		if(pageNo != 1) {
		  pageBar += "&nbsp;<a href='memberManagement.sb?currentShowPageNo="+(pageNo-1)+"&filterCondition="+filterCondition+"'>[이전]</a>&nbsp;";		  		  
		}
		
		while(!(loop > blockSize || pageNo > totalPage)) {
			  
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "&nbsp;<a class='active'>" + pageNo + "</a>&nbsp;";			  
			} else {			  
				pageBar += "&nbsp;<a href='memberManagement.sb?currentShowPageNo="+pageNo+"&filterCondition="+filterCondition+"'>"+pageNo+"</a>&nbsp;";
			}

			pageNo++;	// 1 2 3 4 5... (pageNo이 1이라면).... 40 41 42
			loop++;	// 1 2 3 4 5 6 7 8 9 10
		}
		
		if(!(pageNo > totalPage)) {
		  pageBar += "&nbsp;<a href='memberManagement.sb?currentShowPageNo="+pageNo+"&filterCondition="+filterCondition+"'>[다음]</a>&nbsp;";		  
		}		
		
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageBar : "+pageBar);
		
		request.setAttribute("memberList", memberList);
		request.setAttribute("pageBar", pageBar);
		
		
		super.setViewPage("/WEB-INF/admin/member_management.jsp");

	}

}
