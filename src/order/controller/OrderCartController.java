package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderCartController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("OrderCartController가 실행중입니다.");
		
//		super.setRedirect(false);
		super.setViewPage("/WEB-INF/order/order_cart.jsp");
		
	}

}
