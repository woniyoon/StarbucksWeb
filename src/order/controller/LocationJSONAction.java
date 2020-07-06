package order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import order.model.InterOrderDAO;
import order.model.LocationVO;
import order.model.OrderDAO;

public class LocationJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterOrderDAO dao = new OrderDAO();
		
		List<LocationVO> storeList = dao.getStoreList();
		
		JSONArray jArray = new JSONArray();
		
		for(LocationVO lvo : storeList) {
			JSONObject obj = new JSONObject();
			
			obj.put("storeID", lvo.getStoreID());
			obj.put("storeName", lvo.getStoreName());
			obj.put("address", lvo.getAddress());
			obj.put("latitude", lvo.getLatitude());
			obj.put("longitude", lvo.getLongitude());
			obj.put("url", lvo.getUrl());
			obj.put("zIndex", lvo.getzIndex());

			jArray.put(obj);
		}

		request.setAttribute("json", jArray.toString());
		super.setViewPage("/WEB-INF/order/result.jsp");
	}

}
