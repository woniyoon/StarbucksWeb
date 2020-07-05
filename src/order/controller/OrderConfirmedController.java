package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderConfirmedController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderConfirmedController가 실행중입니다.");
	
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
