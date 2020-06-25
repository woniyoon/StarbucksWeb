package order.model;

import java.sql.SQLException;
import java.util.*;

import product.model.*;

public interface InterOrderDAO {
	
	// 장바구니를 가져옴
	List<ProductVO> getShoppingCart(Map<String, String> paramap) throws SQLException;
	
	List<ShoppingCartVO> getCart(Map<String, String> paramap) throws SQLException;
	
	FoodVO getFoodInfo(String productID) throws SQLException;
	
	DrinkVO getDrinkInfo(String productID) throws SQLException;

	List<LocationVO> getStoreList() throws SQLException;

	// 커스텀 비용 가져옴
	Map<String, Integer> getCustomPrice() throws SQLException;
}
