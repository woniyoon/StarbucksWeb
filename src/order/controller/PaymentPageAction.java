package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class PaymentPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		String slipNo = request.getParameter("slipNo");
		if(!super.checkLogin(request) || !("GET".equalsIgnoreCase(method)) || slipNo == null) {
			String msg = "정상적인 경로가 아닙니다.";
			String loc = "/StarbucksWeb/index.sb";
			
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
		} else {
		
			System.out.println(method);
			System.out.println(slipNo);
			
			System.out.println("PaymentPageAction !!!! ");
				
			request.setAttribute("slipNo", slipNo);
			super.setViewPage("/WEB-INF/order/paymentGateway.jsp"); 
			
		}
		
	}

}


