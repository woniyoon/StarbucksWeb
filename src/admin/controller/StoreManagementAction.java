package admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.InterStoreDAO;
import admin.model.StoreDAO;
import admin.model.StoreVO;
import common.controller.AbstractController;
import member.model.MemberVO;

public class StoreManagementAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// == 관리자(admin)로 로그인 했을때만 조회가 가능하도록 한다. ==
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser == null) {
			
			String message = "먼저 로그인 해야 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		
		else {
			String userid = loginuser.getUserid();
			
			if(!"admin".equals(userid)) {
				String message = "관리자만 접근이 가능합니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
		}
		
		InterStoreDAO storeDAO = new StoreDAO();
		
		// *** 페이징 처리한 전체 매장 목록 보여주기 *** // --------------------------
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		String sizePerPage = request.getParameter("sizePerPage"); // 기본값 무조건 10
	
		if (currentShowPageNo == null)
			currentShowPageNo = "1";
		
		if (sizePerPage == null)
			sizePerPage = "10";
		
		HashMap<String,String> sMap = new HashMap<String,String>();
		
		sMap.put("currentShowPageNo", currentShowPageNo);
		sMap.put("sizePerPage", sizePerPage);
		
		// -----------------------------------------------------------------

		// 전체 매장 정보 가져오기 메소드 생성
		List<StoreVO> storeList = storeDAO.selectPagingStore(sMap);
		
		request.setAttribute("storeList", storeList);
		request.setAttribute("sizePerPage", sizePerPage);
		
		// *** 페이지바 만들기 *** // -----------------------------------------------------
		/*
		   1개블럭당 10개씩 잘라서 페이지 만든다.
		   1개 페이지당 3개행 또는 5개행 또는 10개행을 보여주는데
		      만약에 1개 페이지당 5개행을 보여준다라면
		      몇개블럭이 나와야 할까?
		      총회원수가 207명 이라면 1개 페이지당 보여줄 개수가 5개 라면
		      총회원수 207/5 = 41.4 ==> 42(totalPage)
		    
		   1블럭                 1 2 3 4 5 6 7 8 9 10 [다음] 
		   2블럭     [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
		   3블럭     [이전] 21 22 23 24 25 26 27 28 29 30 [다음]
		   4블럭     [이전] 31 32 33 34 35 36 37 38 39 40 [다음]
		   5블럭     [이전] 41 42 
		 */
		
		// 페이징처리를 위한 전체회원에 대한 총페이지갯수 알아오기(select)
		int totalPage = storeDAO.getTotalPage(sMap);
		
		// === !!! 페이징처리 공식 !!! === //
		/*
	        1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다.
	        11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.
	        21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
	        
	        currentShowPageNo         pageNo
	        ---------------------------------
	             1                      1 = ((1 - 1)/10) * 10 + 1
	             2                      1 = ((2 - 1)/10) * 10 + 1
	             3                      1 = ((3 - 1)/10) * 10 + 1
	             4                      1
	             5                      1
	             6                      1
	             7                      1 
	             8                      1
	             9                      1
	             10                     1 = ((10 - 1)/10) * 10 + 1
	            
	             11                    11 = ((11 - 1)/10) * 10 + 1
	             12                    11 = ((12 - 1)/10) * 10 + 1
	             13                    11 = ((13 - 1)/10) * 10 + 1
	             14                    11
	             15                    11
	             16                    11
	             17                    11
	             18                    11 
	             19                    11 
	             20                    11 = ((20 - 1)/10) * 10 + 1
	             
	             21                    21 = ((21 - 1)/10) * 10 + 1
	             22                    21 = ((22 - 1)/10) * 10 + 1
	             23                    21 = ((23 - 1)/10) * 10 + 1
	             ..                    ..
	             29                    21
	             30                    21 = ((30 - 1)/10) * 10 + 1
	    */
		
		int pageNo = 1;
		// pageNo 는 페이지바에서 보여지는 첫번째 페이지번호이다.
		
		int blockSize = 10;
		// blockSize 는 블럭당 보여지는 페이지 번호의 개수이다.
		
		int loop = 1;
		// loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다.
		
		// !!! 다음은 pageNo를 구하는 공식이다. !!!
		pageNo = ((Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		/*
			currentShowPageNo => 3		pageNo => ( (3-1)/10)*10 + 1	==> 1
			currentShowPageNo => 7		pageNo => ( (7-1)/10)*10 + 1	==> 1
			currentShowPageNo => 10		pageNo => ( (10-1)/10)*10 + 1	==> 1
			
			currentShowPageNo => 13		pageNo => ( (13-1)/10)*10 + 1	==> 11
			currentShowPageNo => 17		pageNo => ( (17-1)/10)*10 + 1	==> 11
			currentShowPageNo => 20		pageNo => ( (20-1)/10)*10 + 1	==> 11
			
		 */
		
		
		String pageBar = "";
		
		
		// *** [이전] 만들기 *** //
		 if( pageNo != 1 ) {
			pageBar += "&nbsp;<a href='storeManagement.sb?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"'>[이전]</a>&nbsp;";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				// 현재 클릭한 페이지 넘버라면
				pageBar += "&nbsp;<span style='color:red; border: solid 1px gray; padding: 2px 4px;'>"+pageNo+"</span>&nbsp;";
			}
			
			else {
				pageBar += "&nbsp;<a href='storeManagement.sb?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>"+pageNo+"</a>&nbsp;";
			}
			
			pageNo++; // 1 2 3 4 5 6 7 8 9 10 11 12 ... 40 41 42
			loop++;	  // 1 2 3 4 5 6 7 8 9 10		
		}
		
		// *** [다음] 만들기 *** //
		if( !(pageNo > totalPage) ) {
			pageBar += "&nbsp;<a href='storeManagement.sb?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>[다음]</a>&nbsp;";
		}

		request.setAttribute("pageBar", pageBar);

		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/store_management.jsp");
	}

}
