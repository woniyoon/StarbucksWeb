package order.model;

import java.sql.SQLException;
import java.util.*;

import product.model.*;

public interface InterOrderDAO {
	
	// TODO: 사용하지 않음
	List<ProductVO> getShoppingCart(Map<String, String> paramap) throws SQLException;
	
	// 장바구니 가져옴
	List<ShoppingCartVO> getCart(Map<String, String> paramap) throws SQLException;
	
	// 장바구니에 담긴 푸드 정보 가져옴
	FoodVO getFoodInfo(String productID) throws SQLException;
	
	// 장바구니에 담긴 음료 정보 가져옴
	DrinkVO getDrinkInfo(String productID) throws SQLException;

	// 커스텀 비용 가져옴
	Map<String, Integer> getCustomPrice() throws SQLException;

	// 파라미터로 받은 itemSeq를 이용해 장바구니 아이템 삭제
	int deleteCartItem(String itemSeqToDelete) throws SQLException;

	// 전체 매장 리스트를 가져옴
	List<LocationVO> getStoreList() throws SQLException;
}
