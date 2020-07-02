package product.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class AddMyMenuController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		String productId = request.getParameter("productId"); 
		HttpSession session = request.getSession();
	
		if(!"POST".equalsIgnoreCase(method)) {
			
			String message = "비정상적인 경로로 들어왔습니다";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			super.setViewPage("/WEB-INF/msg.jsp");
			return;
			
		} else {
			
			// === 로그인 유무 검사하기 === //
			boolean isLogin = super.checkLogin(request);
			
			if(!isLogin) { // 로그인을 하지 않은 상태라면
				
				//   사용자가 로그인을 하지 않은 상태에서 특정제품을 나만의 메뉴로 등록하려는 경우
				//  사용자가 로그인을 하면 장바구니에 담고자 했던 그 특정제품 페이지로 이동하도록 해야 한다.
				 
				String goBackURL = request.getParameter("goBackURL");
				
				session.setAttribute("goBackURL", goBackURL);
				
				request.setAttribute("message", "로그인이 필요한 기능 입니다.");
				request.setAttribute("loc", "javascript:history.back()");
				
				super.setViewPage("/WEB-INF/msg.jsp");
				return;
				
			} else { // 로그인을 한 상태라면   DB에 집어넣잔
				// 장바구니 테이블(shopping_cart)에 해당 제품을 담아야 한다.
				// 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 shopping_cart 테이블에 insert 를 해야하고, 
				// 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 shopping_cart 테이블에 update 를 해야한다. 

				String userid = ((MemberVO) session.getAttribute("loginuser")).getUserid();
				System.out.println("!@#$%^!@$#^%$@!#%$^ : " + userid);
//				String userid =  "dong";
				productId = request.getParameter("productId"); 
				String productName = request.getParameter("productName");
				String parentTable = request.getParameter("parentTable");
				String section = "0";
				
				if("FOOD".equalsIgnoreCase(parentTable)) {
					section = "1";
				}
				
				HashMap<String, String> paraMap = new HashMap<>();
				paraMap.put("userid", userid);
				paraMap.put("productId", productId);
				paraMap.put("productName", productName);
				paraMap.put("section", section);

				System.out.println(productId);
				InterProductDAO pdao = new ProductDAO();
				
//				int n = pdao.addMyMenu( ((MemberVO) session.getAttribute("userid")).getUserid(), productId); // session.getAttribute("loginuser") 이거가 object라서  MemberVO 해줘야함
				int n = pdao.addMyMenu(paraMap);
				
//				if(n>0) {
//					request.setAttribute("message", "마이메뉴에 담았습니다.");
//					request.setAttribute("loc", "#"); // 돌아가야 할 페이지
//					//장점구니 목록 보여주기 페이지 이동
//				} else {
//					request.setAttribute("message", "마이메뉴 담기 실패!");
//					request.setAttribute("loc", "javascript:history.back()");
//				}
				
				JSONObject json = new JSONObject();
				json.put("result", n);
				request.setAttribute("json", json);
				
				super.setViewPage("/WEB-INF/product_view/result.jsp");
				
			}
		}
	}

}
