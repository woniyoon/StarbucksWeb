package order.controller;

import java.util.*;

import javax.servlet.http.*;

import org.json.*;

import common.controller.AbstractController;
import order.model.*;

public class SumExtraCustomAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("SumExtraCustomAction");
//		System.out.println(request.getParameter("cart_seq_no"));
//		System.out.println(request.getParameter("name"));
//		System.out.println(request.getParameter("value"));

		InterOrderDAO dao = new OrderDAO();
		
		Map<String, Integer> priceMap = dao.getCustomPrice();
		
		JSONObject obj = new JSONObject();

		/*
		 * priceMap.forEach((key, value)->{ obj.put(key, value); });
		 */
		
		for( Map.Entry<String, Integer> priceInfo : priceMap.entrySet() ){
			obj.put(priceInfo.getKey(), priceInfo.getValue());
        }
		
		request.setAttribute("json", obj);
		
		super.setViewPage("/WEB-INF/order/result.jsp");
	}

}
