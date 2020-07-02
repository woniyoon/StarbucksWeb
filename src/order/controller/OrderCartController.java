package order.controller;

import java.util.*;

import javax.servlet.http.*;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.*;
import product.model.*;

public class OrderCartController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("OrderCartController가 실행중입니다.");
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("loginuser");
//		String userid = (String) request.getSession().getAttribute("userid");

//		System.out.println(user.getUserid());
		if(user == null) {
			
			String msg = "로그인부터 해야합니다.";
			String loc = "/StarbucksWeb/index.sb";
			
			request.setAttribute("message", msg);
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
			
		} else {
			String userid =user.getUserid();

			Map<String, String> paramap = new HashMap<String, String>();
			paramap.put("userid", userid);
			
			InterOrderDAO dao = new OrderDAO();
//		List<ProductVO> shoppingCart = dao.getShoppingCart(paramap);
			List<ShoppingCartVO> shoppingCart = dao.getCart(paramap);
			
			request.setAttribute("cart", shoppingCart);
			
			super.setViewPage("/WEB-INF/order/order_cart.jsp");
		}
		

	}

}
