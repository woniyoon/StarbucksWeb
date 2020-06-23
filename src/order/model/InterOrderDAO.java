package order.model;

import java.sql.SQLException;
import java.util.*;

import product.model.*;

public interface InterOrderDAO {
	
	// 장바구니를 가져옴
	List<ProductVO> getShoppingCart(Map<String, String> paramap) throws SQLException;
	
	FoodVO getFoodInfo(String productID) throws SQLException;
	
	DrinkVO getDrinkInfo(String productID) throws SQLException;
}
