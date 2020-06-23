package order.controller;

import java.util.*;

import javax.servlet.http.*;

import org.json.*;

import common.controller.AbstractController;
import order.model.*;
import product.model.*;

public class OrderCartController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("OrderCartController가 실행중입니다.");
		
//		String userid = request.getSession().getAttribute("userid");
		String userid = "woniyoon";
		Map<String, String> paramap = new HashMap<String, String>();
		paramap.put("userid", userid);
		
		InterOrderDAO dao = new OrderDAO();
		List<ProductVO> shoppingCart = dao.getShoppingCart(paramap);
		
//		System.out.println(shoppingCart.size());
//		JSONArray jArray = new JSONArray();
//		
//		for(ProductVO pvo : shoppingCart) {
//			JSONObject obj = new JSONObject();
//			obj.put("id", pvo.getProductId());
//			obj.put("name", pvo.getName());
//			obj.put("price", pvo.getPrice());
//			obj.put("img", pvo.getImg());
//			
//			if(pvo instanceof DrinkVO) {
//				obj.put("shot", ((DrinkVO) pvo).getShot());
//				obj.put("syrup", ((DrinkVO) pvo).getSyrup());
//				obj.put("whipped_cream", ((DrinkVO) pvo).getWhippedCream());
//				obj.put("temperature", ((DrinkVO) pvo).getTemperature());
//				obj.put("base", ((DrinkVO) pvo).getBase());
//			}
//
//			jArray.put(obj);
//		}
//		
//		System.out.println(jArray.toString());
		request.setAttribute("cart", shoppingCart);
		
//		super.setRedirect(false);
		super.setViewPage("/WEB-INF/order/order_cart.jsp");

	}

}
