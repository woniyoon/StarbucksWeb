package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.InterOrderDAO;
import order.model.OrderDAO;
import order.model.ShoppingCartVO;

public class OrderPaymentController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("OrderPaymentController가 실행중입니다.");
		String storeID = request.getParameter("store_id");
		MemberVO user = (MemberVO) request.getSession().getAttribute("loginuser");
	
		String method = request.getMethod();
	
		

		if(storeID == null) {
				
			String msg = "잘못된 경로입니다!";
			String loc = "/StarbucksWeb/index.sb";
			
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		} else if(user == null) {
			
			String msg = "로그인부터 해야합니다.";
			String loc = "/StarbucksWeb/index.sb";
			
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
		} else {
			System.out.println(storeID);
			HashMap<String, String> paramap = new HashMap<String, String>();
			
			paramap.put("userid", user.getUserid());
			paramap.put("storeID", storeID);
			InterOrderDAO dao = new OrderDAO();
			
			List<ShoppingCartVO> cart = dao.getCartWithCustoms(paramap);
			
			for(ShoppingCartVO c : cart) {
				System.out.println(c.getProduct().getName());
			}
			
			request.setAttribute("cart", cart);
		//		super.setRedirect(false);
			super.setViewPage("/WEB-INF/order/order_payment.jsp");

		}
		
	}

}
