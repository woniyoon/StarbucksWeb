package order.controller;

import java.util.List;

import javax.servlet.http.*;

import org.json.*;

import common.controller.AbstractController;
import order.model.*;

public class OrderLocationController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		InterOrderDAO dao = new OrderDAO();
		
		List<LocationVO> storeList = dao.getStoreList();
		
//		JSONArray jArray = new JSONArray();
//		
//		for(LocationVO lvo : storeList) {
//			JSONObject obj = new JSONObject();
//			System.out.println(lvo.getStoreName());
//			
//			obj.put("storeID", lvo.getStoreID());
//			obj.put("storeName", lvo.getStoreName());
//			obj.put("address", lvo.getAddress());
//			obj.put("latitude", lvo.getLatitude());
//			obj.put("longitude", lvo.getLongitude());
//
//			jArray.put(obj);
//		}

		request.setAttribute("storeList", storeList);
		
		
		super.setViewPage("/WEB-INF/order/order_location.jsp");
	}

}
