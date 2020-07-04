package order.controller;

import java.util.*;

import javax.servlet.http.*;

import org.json.JSONObject;

import common.controller.AbstractController;
import order.model.*;
import member.model.*;

public class UpdatePurchaseAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = ((MemberVO) request.getSession().getAttribute("loginuser")).getUserid();
		Integer point = ((MemberVO) request.getSession().getAttribute("loginuser")).getPoint();
		String storeId = request.getParameter("storeId");
		System.out.println(request.getParameter("pricePerItems"));
		System.out.println(request.getParameter("storeId"));

		String[] pricePerItems = request.getParameter("pricePerItems").split(",");
		
		String[] productIds = request.getParameter("productIds").split(",");
		String[] itemSeqArr = request.getParameter("itemSeqArr").split(",");	// shoppingcart_seq;
		String pricePaid = request.getParameter("pricePaid");
		String deductedPoint = request.getParameter("deductedPoint");
		String slipNo = request.getParameter("slipNo");
		
		InterOrderDAO dao = new OrderDAO();

		// 전표 객체 생성
		SlipVO slip = new SlipVO();
		slip.setSlipNum(slipNo);
		slip.setStoreId(storeId);
		slip.setUserid(userid);
		
		
		// 구매상세 객체 생성
		List<PurchaseDetailVO> pdvList = new ArrayList<>();
		
		for(int i=0; i<productIds.length; i++) {
			
			PurchaseDetailVO pdvo = new PurchaseDetailVO();
			
			pdvo.setProductId(productIds[i]);
			pdvo.setSlipNum(slipNo);
			pdvo.setUserid(userid);
			pdvo.setStoreId(storeId);
			pdvo.setCnt(1);
			pdvo.setPrice(Integer.parseInt(pricePerItems[i]));
			
			if("F".equalsIgnoreCase(pdvo.getProductId().substring(0,1))) {
				pdvo.setSection(1);
			} else {
				pdvo.setSection(0);
			}
			
			pdvList.add(pdvo);
			System.out.println("productIds 반복문 횟수 : " +i);
 		}
		
		Map<String, Object> paramap = new HashMap<>();
		paramap.put("slip", slip);
		paramap.put("pdvList", pdvList);
		paramap.put("userid", userid);
		paramap.put("itemSeqArr", itemSeqArr);
		paramap.put("pricePaid", pricePaid);
		paramap.put("deductedPoint", deductedPoint);
		paramap.put("point", point);

		System.out.println(" 왜이래 ㅡㅡ ");
		
		boolean isUpdated = dao.updateConfirmedPurchase(paramap);

		System.out.println("~~~~ isUpdated : " + isUpdated);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isUpdated", isUpdated);
		String json = jsonObj.toString();
		
		System.out.println(json);
		
		request.setAttribute("json", json);
		
		super.setViewPage("/WEB-INF/order/result.jsp");
	}

}
