package product.model;

import java.sql.SQLException;
import java.util.List;

public interface InterProductDAO {

	// product list
	List<ProductVO> getProductList() throws SQLException;

	//sList<NutritionVO> getNutritionList() throws SQLException;
	
	// 개별 제품에 대한 영양정보 가져오기
	NutritionVO getNutritionInfo(String productId) throws SQLException;

	// 제품번호를 가지고서 해당 음료수의 정보를 조회해오기
	ProductVO selectOneDrinkByID(String type, String productId) throws SQLException;
	
	// 제품번호를 가지고서 해당 푸드의 정보를 조회해오기
	ProductVO selectOneFoodByID(String type, String productId) throws SQLException;

	
	// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
//	List<String> getImagesByProductId(String productId) throws SQLException;

}
