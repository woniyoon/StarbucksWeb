package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;
public class ProductMenuController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {  //dao 갖고오자~
		
		InterProductDAO pdao = new ProductDAO();
		
		List<ProductVO> productList = pdao.getProductList();		
		
		for(ProductVO pvo : productList) {
			NutritionVO nvo = pdao.getNutritionInfo(pvo.getProductId());
			pvo.setNutrition(nvo);
			//System.out.println(nvo.getKcal());
		}
		
		
	//	List<NutritionVO> nutritionList = new ArrayList<>();
		
		request.setAttribute("productList", productList);
	//	request.setAttribute("nutritionList", nutritionList);
		
		super.setViewPage("/WEB-INF/product_view/product_menu.jsp");
	} 

}
