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

	// 커스텀 옵션과 최종가격을 업데이트
	int updateShoppingCart(HashMap<String, String> paraMap) throws SQLException;

	// 커스텀&최종가격이 업데이트 된 카트를 가져오기
	List<ShoppingCartVO> getCartWithCustoms(HashMap<String, String> paramap) throws SQLException;

	// 매장 이름 가져오기
	String getStoreName(HashMap<String, String> paramap) throws SQLException;
	
	// 결제후 DB 업데이트
	boolean updateConfirmedPurchase(Map<String, Object> paraMap) throws SQLException;
	
	// 전표 업데이트
	int insertSlip(SlipVO slip) throws SQLException;

	// 구매상세 업데이트
	int insertPurchaseDetail(List<PurchaseDetailVO> pdvoList) throws SQLException;
	
	// 적립금 업데이트
	int updateMyPoint(Map<String, Object> paramap)  throws SQLException;
	
	// 장바구니 업데이트
	int deleteCart(Map<String, Object> paramap) throws SQLException;

}
