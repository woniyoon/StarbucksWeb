package feedback.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import notice.model.InterNoticeDAO;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class FeedbackListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterNoticeDAO dao = new NoticeDAO();
		// *** 페이징 처리 안한 전체 글 목록 보여주기 ***
		// List<NoticeVO> noticeList = dao.noticeTitleList();
		// request.setAttribute("noticeList", noticeList);
		
		
		// *** 페이징 처리한 글목록 보여주기 ***
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		String sizePerPage = request.getParameter("sizePerPage"); // 기본값 무조건 10
	
		if (currentShowPageNo == null)
			currentShowPageNo = "1";
		
		if (sizePerPage == null)
			sizePerPage = "10";
			
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("currentShowPageNo", currentShowPageNo);
		paraMap.put("sizePerPage", sizePerPage);

		// 검색어를 가져온다.
		String searchWord = request.getParameter("searchWord");
		System.out.println("~~~ searchWord : " + searchWord);
		
		if ( searchWord != null && !searchWord.trim().isEmpty() ) {
			paraMap.put("searchWord", searchWord);
			
		}

		List<NoticeVO> noticeList = dao.selectOneNotice(paraMap);

		request.setAttribute("noticeList", noticeList);
		request.setAttribute("sizePerPage", sizePerPage);		
		
		// 페이징 처리를 위한 공지사항에 대한 총 페이지개수 알아오기(select) --------------------------------
		int totalPage = dao.getTotalPage(paraMap);
		
		int pageNo = 1;
		// pageNo 는 페이지바에서 보여지는 첫번째 페이지번호이다.
		
		int blockSize = 10;
		// blockSize 는 블럭당 보여지는 페이지 번호의 개수이다.
		
		int loop = 1;
		
		// !!! 다음은 pageNo를 구하는 공식이다. !!!
		pageNo = ((Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
		String pageBar = "";
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		// *** [이전] 만들기 *** //
		if( pageNo != 1 ) {
			pageBar += "&nbsp;<a href='noticeList.sb?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"'>[이전]</a>&nbsp;";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				// 현재 클릭한 페이지 넘버라면
				pageBar += "&nbsp;<span style='color:red; border: solid 1px gray; padding: 2px 4px;'>"+pageNo+"</span>&nbsp;";
			}
			
			else {
				pageBar += "&nbsp;<a href='noticeList.sb?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"'>"+pageNo+"</a>&nbsp;";
			}
			
			pageNo++; // 1 2 3 4 5 6 7 8 9 10 11 12 ... 40 41 42
			loop++;	  // 1 2 3 4 5 6 7 8 9 10		
		}
		
		// *** [다음] 만들기 *** //
		if( !(pageNo > totalPage) ) {
			pageBar += "&nbsp;<a href='noticeList.sb?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchWord="+searchWord+"'>[다음]</a>&nbsp;";
		}

		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("searchWord", searchWord);
		

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/feedback/feedbackList.jsp");

	}

}
