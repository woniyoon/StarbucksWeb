package order.controller;

import javax.servlet.http.*;

import common.controller.AbstractController;
import order.model.*;

public class UpdatePurchaseAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String storeId = request.getParameter("storeId");
		String[] pricePerItems = request.getParameterValues("pricePerItems");
		String[] productIds = request.getParameterValues("productIds");
		String[] itemSeqArr = request.getParameterValues("itemSeqArr");
		String pricePaid = request.getParameter("pricePaid");
		String deductedPoint = request.getParameter("deductedPoint");
		String slipNo = request.getParameter("slipNo");
		
		
		
		// 1. 전표 업데이트 (전표번호/아이디/매장아이디/판매일자/전표시퀀스)
		// 2. 구매상세 업데이트 (제품아이디/전표번호/아이디/매장아이디/주문수량/금액/분류/구매상세시퀀스)
		// 3. 장바구니 삭제 (아이디/아이템시퀀스)
		InterOrderDAO dao = new OrderDAO();
		
		super.setViewPage("/WEB-INF/order/result.jsp");
	}

}
