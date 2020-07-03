package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class PaymentPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		String slipNo = request.getParameter("slipNo");
		String amount = request.getParameter("amount");
		boolean isValidNumber = true;
		
		// 파라미터에 제대로 된 금액이 전달됐는지 확인
		try {
			Integer.parseInt(amount);
		} catch (Exception e) {
			isValidNumber = false;
		}
		
		System.out.println(isValidNumber);
		
		if(!super.checkLogin(request) || slipNo == null || !isValidNumber) {
			String msg = "정상적인 경로가 아닙니다.";
			String loc = "javascript:self.close()";
			
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


