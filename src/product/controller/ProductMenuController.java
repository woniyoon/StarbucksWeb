package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.ProductDAO;
import product.model.ProductVO;
public class ProductMenuController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {  //dao 갖고오자~
		
		InterProductDAO pdao = new ProductDAO();
		
		List<ProductVO> productList = pdao.getProductList();
		
		request.setAttribute("productList", productList);
		
		super.setViewPage("/WEB-INF/product_view/product_menu.jsp");
	} 

}
