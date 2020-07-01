package order.controller;

import java.util.*;

import javax.servlet.http.*;

import org.json.*;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;

public class OrderLocationController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterOrderDAO dao = new OrderDAO();
		
		String[] customOptions = request.getParameterValues("custom");
		String[] cartSeq = request.getParameterValues("cart_seq");
		String[] finalPrice = request.getParameterValues("final_price");
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			String msg = "잘못된 경로입니다!";
			String loc = "/StarbucksWeb/index.sb";
			
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
			
		} else {
			
			
			// TODO: 로그인 여부 확인 
//			MemberVO loginuser = ((MemberVO) request.getSession().getAttribute("loginuser"));
//			
//			if(loginuser != null) {
//				
//				
//			} else {
//				String msg = "로그인부터 해야합니다.";
//				String loc = "/StarbucksWeb/index.sb";
//				
//				request.setAttribute("message", msg);
//				request.setAttribute("loc", loc);
//				
//				super.setViewPage("/WEB-INF/msg.jsp");
//			}
			
			
			// 매장위치 선택으로 넘어오면서 쇼핑카트 테이블 업데이트
			for(int i=0; i<cartSeq.length; i++) {
				System.out.println(finalPrice[i]);

				HashMap<String, String> paraMap = new HashMap<>();
				paraMap.put("customOption", customOptions[i]);
				paraMap.put("cart_seq", cartSeq[i]);
				paraMap.put("finalPrice", finalPrice[i]);
				
				int n = dao.updateShoppingCart(paraMap);
				
				if(n != 1) {
					
					String msg = "다시 시도해주세요!";
					String loc = "javascript:history.go(-1)";
					
					request.setAttribute("message", msg);
					request.setAttribute("loc", loc);
					
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				
			}
			
			
			request.setAttribute("customOptions", customOptions);
			request.setAttribute("productIDs", cartSeq);
			
			super.setViewPage("/WEB-INF/order/order_location.jsp");
			
			
		}
		
		// 로그인 여부 체크 
		
		
		
		
	
	}

}
