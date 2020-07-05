package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import admin.model.AdminDAO;
import admin.model.InterAdminDAO;
import common.controller.AbstractController;
import product.model.InterProductDAO;
import product.model.NutritionVO;
import product.model.ProductDAO;
import product.model.ProductVO;

public class MenuListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		InterAdminDAO adao = new AdminDAO();
		
		// 페이징 처리
		String currentShowPageNo = request.getParameter("currentPage");		
		String category = request.getParameter("category");
		
		HashMap<String, String> paraMap = new HashMap<>();
		int sizePerPage = 10;	// 한 페이지에 보여주는 멤버 수;
		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		
		paraMap.put("currentShowPageNo", currentShowPageNo);
		paraMap.put("itemsPerPage", String.valueOf(sizePerPage));
		
		List<ProductVO> productList = new ArrayList<>();
		int numOfItems = 0;
		
		if("DRINK".equalsIgnoreCase(category)) {
			productList = adao.getDrinkList(paraMap);
			numOfItems = adao.getNumOfDrinks();
		} else {
			productList = adao.getFoodList(paraMap);
			numOfItems = adao.getNumOfFood();
		}
		
		
		int totalPage = (numOfItems / sizePerPage);
		
		System.out.println("currentPage : " + currentShowPageNo);
		
		if(numOfItems % sizePerPage > 0) {
			totalPage = totalPage + 1;
		}
		
		// 페이지에서 보여지는 첫번째 페이지 번호
		int pageNo = 1;
		// 블럭당 보여지는 페이지 번호의 갯수
		int blockSize = 10;
		// 1부터 증가해 1개 블럭을 이루는 페이지 번호의 갯수(10개)까지만 증가하는 용도
		int loop = 1;
		
		pageNo = ((Integer.parseInt(currentShowPageNo)-1)/blockSize) * blockSize + 1;

		
		String pageBar = "";

		
		if(pageNo != 1) {
			pageBar += "&nbsp;<a href='javascript:getMenuList("+(pageNo-1)+")'>[이전]</a>&nbsp;";		  		  
		}
		

		while(!(loop > blockSize || pageNo > totalPage)) {
			  
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "&nbsp;<span style='color: red; font-weight: bold; border: solid 1px grey; padding: 2px 4px'>" + pageNo + "</span>&nbsp;";			  
			} else {			  
				pageBar += "&nbsp;<a href='javascript:getMenuList("+pageNo+")'>"+pageNo+"</a>&nbsp;";
			}
			

			pageNo++;	// 1 2 3 4 5... (pageNo이 1이라면).... 40 41 42
			loop++;	// 1 2 3 4 5 6 7 8 9 10
		}
		
		if(!(pageNo > totalPage)) {
		  pageBar += "&nbsp;<a href='javascript:getMenuList("+pageNo+")'>[다음]</a>&nbsp;";		  
		}		
		
		
		request.setAttribute("productList", productList);		
		request.setAttribute("pageBar", pageBar);

		
		JSONArray json = new JSONArray();
		
		for(ProductVO pvo : productList) {
			JSONObject obj = new JSONObject();

			obj.put("parentTable", pvo.getParentTable());
			obj.put("id", pvo.getProductId());
			obj.put("categoryID", pvo.getCategoryID());
			obj.put("name", pvo.getName());
			obj.put("description", pvo.getDescription());
			obj.put("price", pvo.getPrice());
			obj.put("img", pvo.getImg());
//			obj.put("totalPage", totalPage);
//			obj.put("pageNo", pageNo);
			obj.put("pageBar", pageBar);
			obj.put("numOfItems", numOfItems);
			
			json.put(obj);
		}
		
		json.toString();
		request.setAttribute("json", json);
		
		
		super.setViewPage("/WEB-INF/jsonview.jsp");
	}

}
