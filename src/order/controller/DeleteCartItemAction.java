package order.controller;

import javax.servlet.http.*;

import org.json.JSONObject;

import common.controller.AbstractController;
import order.model.*;

public class DeleteCartItemAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String itemSeqToDelete = request.getParameter("itemSeq");
		String itemName = request.getParameter("itemName");
		String resultMsg = "";
		
		InterOrderDAO dao = new OrderDAO();
		int result = dao.deleteCartItem(itemSeqToDelete);
		
		JSONObject obj = new JSONObject();
		if(result != 0) {
			resultMsg = itemName + "이/가 장바구니에서 삭제됐습니다.";
		} else {
			resultMsg = "삭제 도중 문제가 발생했습니다. 다시 시도해주세요!";
		}
		
		obj.put("msg", resultMsg);
		obj.put("result", result);
		
		request.setAttribute("json", obj);
		super.setViewPage("/WEB-INF/order/result.jsp");
	}

}
