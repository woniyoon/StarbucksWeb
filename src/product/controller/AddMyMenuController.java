package product.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO;
import product.model.ProductDAO;

public class AddMyMenuController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		String productId = request.getParameter("productId"); 
		HttpSession session = request.getSession();

		if(!"POST".equalsIgnoreCase(method)) {
			
			String message = "비정상적인 경로로 들어왔습니다";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			super.setViewPage("/WEB-INF/msg.jsp");
			return;
			
		} else {
			
			// === 로그인 유무 검사하기 === //
			boolean isLogin = super.checkLogin(request);
			JSONObject json = new JSONObject();
			
			if(!isLogin) { // 로그인을 하지 않은 상태라면
				
				json.put("result", -1);
				request.setAttribute("json", json);
				
				super.setViewPage("/WEB-INF/product_view/result.jsp");
				
			} else { // 로그인을 한 상태라면   
				
				String userid = ((MemberVO) session.getAttribute("loginuser")).getUserid();

				productId = request.getParameter("productId"); 
				String productName = request.getParameter("productName");
				String parentTable = request.getParameter("parentTable");
				String section = "0";
				
				if("FOOD".equalsIgnoreCase(parentTable)) {
					section = "1";
				}
				
				HashMap<String, String> paraMap = new HashMap<>();
				paraMap.put("userid", userid);
				paraMap.put("productId", productId);
				paraMap.put("productName", productName);
				paraMap.put("section", section);

				System.out.println(productId);
				InterProductDAO pdao = new ProductDAO();
				
				int n = pdao.addMyMenu(paraMap);
				
				json = new JSONObject();
				json.put("result", n);
				request.setAttribute("json", json);
				
				super.setViewPage("/WEB-INF/product_view/result.jsp");
				
			}
		}
	}
}