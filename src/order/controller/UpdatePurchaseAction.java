package order.controller;

import java.util.*;

import javax.servlet.http.*;

import common.controller.AbstractController;
import order.model.*;
import member.model.*;

public class UpdatePurchaseAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = ((MemberVO) request.getSession().getAttribute("loginuser")).getUserid();
		String storeId = request.getParameter("storeId");
		String[] pricePerItems = request.getParameterValues("pricePerItems");
		String[] productIds = request.getParameterValues("productIds");
		String[] itemSeqArr = request.getParameterValues("itemSeqArr");
		String pricePaid = request.getParameter("pricePaid");
		String deductedPoint = request.getParameter("deductedPoint");
		String slipNo = request.getParameter("slipNo");
		
		InterOrderDAO dao = new OrderDAO();

		// 1. 전표 업데이트 (전표번호/아이디/매장아이디/판매일자/전표시퀀스)		
		// 전표 객체 생성
		SlipVO slip = new SlipVO();
		slip.setSlipNum(slipNo);
		slip.setStoreId(storeId);
		slip.setUserid(userid);
		
		dao.insertSlip(slip);
		
		// 2. 구매상세 업데이트 (제품아이디/전표번호/아이디/매장아이디/주문수량/금액/분류/구매상세시퀀스)
		// 구매상세 객체 생성
		List<PurchaseDetailVO> pdvList = new ArrayList<>();
		for(int i=0; i<productIds.length; i++) {
			
			PurchaseDetailVO pdvo = new PurchaseDetailVO();
			
			pdvo.setProductId(productIds[i]);
			pdvo.setSlipNum(slipNo);
			pdvo.setUserid(userid);
			pdvo.setStoreId(storeId);
			pdvo.setQty(1);
			pdvo.setPrice(Integer.parseInt(pricePerItems[i]));
			
			if("F".equalsIgnoreCase(pdvo.getProductId().substring(0,1))) {
				pdvo.setSection(1);
			} else {
				pdvo.setSection(0);
			}
 		}
		
		
		// 3. 장바구니 삭제 (아이디/아이템시퀀스)
		
		// 4. 포인트 업데이트 & 적립금
		
		
		super.setViewPage("/WEB-INF/order/result.jsp");
	}

}
