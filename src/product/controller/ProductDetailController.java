package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class ProductDetailController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String productId = request.getParameter("productId"); // 제품번호
		String type = request.getParameter("type"); // 제품번호

		
		System.out.println("type : "+type);
		
		InterProductDAO pdao = new ProductDAO();
		
		List<ProductVO> productList = pdao.getProductList();		
		ProductVO pvo;
		
		/*for(ProductVO pvo : productList) {
			NutritionVO nvo = pdao.getNutritionInfo(pvo.getProductId());
			pvo.setNutrition(nvo);
		}
		
		
		request.setAttribute("productList", productList);*/
		
		
		// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
		
		if("DRINK".equalsIgnoreCase(type)) {
			pvo = pdao.selectOneDrinkByID(type, productId);
		} else {
			pvo = pdao.selectOneFoodByID(type, productId);
		}
		
		 
		
		// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
		//List<String> imgList = pdao.getImagesByProductId(productId);
		
		if(pvo == null) {
			// GET 방식이므로 사용자가 웹브라우저 주소창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
			String message = "검색하신 제품은 존재하지 않습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return;
		}
		else {
			// 제품이 있는 경우
			request.setAttribute("pvo", pvo);
//			request.setAttribute("imgList", imgList);
			//request.setAttribute("goBackURL", MyUtil.getCurrentURL(request));
		
			//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/product_view/product_detail.jsp");

		}
	}
}
