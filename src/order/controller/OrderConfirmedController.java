package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderConfirmedController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderConfirmedController가 실행중입니다.");
	
		if(super.checkLogin(request) || request.getParameter("item_seq") == null) {
			
			String message = "먼저 로그인 해야 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		
		request.getParameter("item_seq");
		request.getParameter("product_id");
		request.getParameter("price_per_item");
		request.getParameter("store_id");
		String priceToPay =  request.getParameter("price_to_pay");
		System.out.println(request.getParameter("store_id"));
		
		request.setAttribute("amount", priceToPay);
		System.out.println(priceToPay);

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/order/order_confirmed.jsp");

	}

}
