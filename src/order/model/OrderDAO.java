package order.model;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import member.model.EncryptMyKey;
import product.model.*;
import util.security.AES256;

public class OrderDAO implements InterOrderDAO {
	private DataSource ds; 	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes = null;
	
	// 생성자 
	public OrderDAO() {
		String key = EncryptMyKey.KEY;
		
		try {
		    Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			aes = new AES256(key);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}	
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	public void close() {
		try {
			if(rs != null) { rs.close(); rs=null; }
			if(pstmt != null) { pstmt.close(); pstmt=null; } 
			if(conn != null) { conn.close(); conn=null; }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductVO> getShoppingCart(Map<String, String> paramap) throws SQLException {
		//ShoppingCartVO shoppingCart = null;
		List<ProductVO> items = new ArrayList<ProductVO>();
		
		try {
			//shoppingCart = new ShoppingCartVO();

			conn = ds.getConnection();
			
			String sql = " select a.product_id, b.parent_table " + 
					" from shoppingcart a, nutrition b " + 
					" where a.userid = ? and a.product_id = b.product_id ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramap.get("userid"));
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				
				String productID = rs.getString(1);
				String parentTable = rs.getString(2);
				
				// Product의 타입에 따라 다른 테이블로 쿼리
				if("food".equalsIgnoreCase(parentTable)) {
					FoodVO fvo = getFoodInfo(productID);
					items.add(fvo);
				} else {
					DrinkVO dvo = getDrinkInfo(productID);
					items.add(dvo);
				}
			}

		} finally {
			close();
		}
		
		return items;
	}

	@Override
	public FoodVO getFoodInfo(String productID) throws SQLException {
		FoodVO fvo = null;

		conn = ds.getConnection();

		String sql = " select id, c.category_name, name, price, img " + 
					" from food f, product_category c\n" + 
					" where f.category_id = c.category_id and f.id = ?  ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productID);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			fvo = new FoodVO();
			fvo.setProductId(rs.getString("id"));
			fvo.setCategoryName(rs.getString("category_name"));
			fvo.setName(rs.getString("name"));
			fvo.setPrice(rs.getInt("price"));
			fvo.setImg(rs.getString("img"));
			fvo.setParentTable("food");
		}
			
		return fvo;
	}



	@Override
	public DrinkVO getDrinkInfo(String productID) throws SQLException {
		
		DrinkVO dvo = null;
		
		conn = ds.getConnection();
		String sql = " select id, c.category_name, name, description, price, img, shot, syrup, whipped_cream, temperature, base " + 
					" from drink d, product_category c " + 
					" where d.category_id = c.category_id and d.id = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productID);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dvo = new DrinkVO();
			dvo.setProductId(rs.getString("id"));
			dvo.setCategoryName(rs.getString("category_name"));
			dvo.setName(rs.getString("name"));
			dvo.setPrice(rs.getInt("price"));
			dvo.setImg(rs.getString("img"));
			dvo.setShot(rs.getInt("shot"));
			dvo.setSyrup(rs.getString("syrup"));
			dvo.setWhippedCream(rs.getString("whipped_cream"));
			dvo.setTemperature(rs.getString("temperature"));
			dvo.setBase(rs.getString("base"));
			dvo.setParentTable("drink");
		
			System.out.println(" getDrinkInfo method :  " + dvo.getName());
		}
		
		return dvo;
	}

	
	// 매장위치 가져오기
	@Override
	public List<LocationVO> getStoreList() throws SQLException {
		List<LocationVO> storeList = new ArrayList<LocationVO>();
		
		try {
			conn = ds.getConnection();
			String sql = " select store_id, store_name, address, latitude, longitude, url, zIndex from store_location ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LocationVO lvo = new LocationVO();
				String storeID = rs.getString("store_id");
				String storeName = rs.getString("store_name");
				String address = rs.getString("address");
				double latitude = rs.getDouble("latitude");
				double longitude = rs.getDouble("longitude");
				String url = rs.getString("url");
				int zIndex = rs.getInt("zIndex");
				
				lvo.setStoreID(storeID);
				lvo.setStoreName(storeName);
				lvo.setAddress(address);
				lvo.setLatitude(latitude);
				lvo.setLongitude(longitude);
				lvo.setUrl(url);
				lvo.setzIndex(zIndex);
				
				storeList.add(lvo);
			}
			
		} finally {
			close();
		}
		
		return storeList;
	}

	@Override
	public List<ShoppingCartVO> getCart(Map<String, String> paramap) throws SQLException {
		//ShoppingCartVO shoppingCart = null;
		List<ShoppingCartVO> items = new ArrayList<ShoppingCartVO>();
				
			try {
				//shoppingCart = new ShoppingCartVO();
	
				conn = ds.getConnection();
				
				String sql = " select a.product_id, b.parent_table, a.shoppingcart_seq " + 
						" from shoppingcart a, nutrition b " + 
						" where a.userid = ? and a.product_id = b.product_id ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paramap.get("userid"));
				rs = pstmt.executeQuery();
			
				while(rs.next()) {
					
					String productID = rs.getString(1);
					String parentTable = rs.getString(2);
					
					
					// Product의 타입에 따라 다른 테이블로 쿼리
					if("food".equalsIgnoreCase(parentTable)) {
						FoodVO fvo = getFoodInfo(productID);
						ShoppingCartVO svo = new ShoppingCartVO();
						svo.setCart(fvo);
						svo.setItemSeq(rs.getString("shoppingcart_seq"));
						items.add(svo);
					} else {
						DrinkVO dvo = getDrinkInfo(productID);
						ShoppingCartVO svo = new ShoppingCartVO();
						svo.setCart(dvo);
						svo.setItemSeq(rs.getString("shoppingcart_seq"));
						items.add(svo);
					}
				}
	
			} finally {
				close();
			}
			
			return items;
	}

	@Override
	public Map<String, Integer> getCustomPrice() throws SQLException {
		Map<String, Integer> priceMap = new HashMap<String, Integer>();
		
		try {
			conn = ds.getConnection();
			String sql = " select name, price from custom_price ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				priceMap.put(rs.getString("name"), rs.getInt("price"));
			}
			
		} finally {
			close();
		}
		
		return priceMap;
	}

	@Override
	public int deleteCartItem(String itemSeqToDelete) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " delete from shoppingcart where shoppingcart_seq = ? ";
			pstmt = conn.prepareStatement(sql);

			int itemSeq = Integer.parseInt(itemSeqToDelete);
			pstmt.setInt(1, itemSeq);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}

	@Override
	public int updateShoppingCart(HashMap<String, String> paraMap) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " update shoppingcart set custom = ?, final_price = ? "+
					" where shoppingcart_seq = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("customOption"));
			pstmt.setInt(2, Integer.parseInt(paraMap.get("finalPrice")));
			pstmt.setString(3, paraMap.get("cart_seq"));
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}
	
	

	@Override
	public List<ShoppingCartVO> getCartWithCustoms(HashMap<String, String> paramap) throws SQLException {
		List<ShoppingCartVO> cart = new ArrayList<>();
		
		try {
			// storeID로 매장명 가져오기
			// userid로 장바구니 목록 가져오기
			conn = ds.getConnection();
			String sql = " select a.product_id, b.parent_table, a.shoppingcart_seq, a.final_price, a.custom "+
						" from shoppingcart a, nutrition b "+
						" where a.userid = ? and a.product_id = b.product_id ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ShoppingCartVO svo = new ShoppingCartVO();
				svo.setItemSeq(rs.getString("shoppingcart_seq"));
				svo.setUserid(paramap.get("userid"));
				ProductVO pvo = null;
				
				System.out.println(rs.getString("product_id"));
				System.out.println(rs.getString("parent_table"));
				
				
				if("DRINK".equalsIgnoreCase(rs.getString("parent_table"))) {
					pvo = getDrinkInfo(rs.getString("product_id"));
				} else {
					pvo = getFoodInfo(rs.getString("product_id"));
				}
								
				// 기본 가격 대신에 커스텀이 적용된 최종가격을 넣어줌
				pvo.setPrice(rs.getInt("final_price"));
				pvo.setCustom(rs.getString("custom"));
				
				svo.setCart(pvo);
				
				cart.add(svo);
			}
			
		} finally {
			close();
		}
		
		return cart;
	}

	@Override
	public String getStoreName(HashMap<String, String> paramap) throws SQLException {
		String storeName = "";
		
		try {
			conn = ds.getConnection();
			String sql = " select store_name, address from store_location where store_id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramap.get("storeID"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				storeName = rs.getString("store_name");
			}
			
		} finally {
			close();
		}
		
		return storeName;
	}
	

	@Override
	public boolean updateConfirmedPurchase(Map<String, Object> paraMap) throws SQLException {
		
		boolean isUpdated = true;
		
		SlipVO slip = (SlipVO) paraMap.get("slip");
		@SuppressWarnings("unchecked")
		ArrayList<PurchaseDetailVO> pdvList = (ArrayList<PurchaseDetailVO>) paraMap.get("pdvList");
		
		System.out.println("pdvList size : " + pdvList.size());
		
		
		int pricePaid = Integer.parseInt((String)paraMap.get("pricePaid"));
		int deductedPoint = Integer.parseInt((String)paraMap.get("deductedPoint"));
		int point = (Integer) paraMap.get("point");
		String userid = (String)paraMap.get("userid");
		String[] itemSeqArr = (String[]) paraMap.get("itemSeqArr");
		
		System.out.println("ㅡㅡ");
		System.out.println(pricePaid);
		System.out.println("보유포인트 : " + point);
		
		int result = 2 + pdvList.size() + itemSeqArr.length;
		int cnt = 0;
		
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
			String sql = " insert into slip (slip_num, userid, store_id, purchase_day, slip_seq) " + 
						" values(?, ?, ?, sysdate, slip_seq.nextval) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, slip.getSlipNum());
			pstmt.setString(2, slip.getUserid());
			pstmt.setString(3, slip.getStoreId());
			
			cnt += pstmt.executeUpdate();
			
			// 전표 업데이트 후 -> 구매사항 업데이트 시도
			sql = " insert into purchase_detail (product_id, slip_num, userid, store_id, cnt, price, section, purchase_detail_seq) " + 
					" values(?, ?, ?, ?, ?, ?, ?, PURCHASE_DETAIL_SEQ.nextval) ";
			
			pstmt = conn.prepareStatement(sql);
			
			for(PurchaseDetailVO pdvo : pdvList) {
				pstmt.setString(1, pdvo.getProductId());
				pstmt.setString(2, pdvo.getSlipNum());
				pstmt.setString(3, pdvo.getUserid());
				pstmt.setString(4, pdvo.getStoreId());
				pstmt.setInt(5, pdvo.getCnt());
				pstmt.setInt(6, pdvo.getPrice());
				pstmt.setInt(7, pdvo.getSection());
				
				System.out.println("구매사항 업데이트 회수 : " + cnt);
				cnt += pstmt.executeUpdate();
			}
			
			// 구매사항 이후 포인트 업데이트 시도
			sql = " UPDATE starbucks_member " + 
					"  SET point = ? " + 
					"  where userid = ? ";
		
			pstmt = conn.prepareStatement(sql);
			
			int updatedPoint = (int) ((point - deductedPoint) + Math.round((pricePaid * 0.02)));
			

			System.out.println("updatedPoint : " + updatedPoint);
			System.out.println("deductedPoint : " + deductedPoint);
			
			pstmt.setInt(1, updatedPoint);
			pstmt.setString(2, userid);
			
			cnt += pstmt.executeUpdate();
			
			
			// 장바구니 지우기 시도
			sql = " DELETE FROM shoppingcart WHERE shoppingcart_seq = ? and userid = ? ";
			pstmt = conn.prepareStatement(sql);

			for(String seq : itemSeqArr) {
				pstmt.setInt(1, Integer.parseInt(seq));
				pstmt.setString(2, userid);
				
				cnt += pstmt.executeUpdate();
			}
			
			// cnt 와 result가 동일한지에 따라 commit / rollback 해준다.
			if(cnt == result) {
				conn.commit();
				isUpdated = true;
			} else {
				conn.rollback();
				isUpdated = false;
			}
			
						
		} finally {
			close();
		}
		
		return isUpdated;
	}
	
	
	
	
	
	
//	@Override
//	public int updateConfirmedPurchase(Map<String, Object> paraMap) throws SQLException {
//		
//		SlipVO slip = (SlipVO) paraMap.get("slip");
//		List<PurchaseDetailVO> pdvList = (ArrayList<PurchaseDetailVO>) paraMap.get("pdvList");
//		int pricePaid = Integer.parseInt((String)paraMap.get("pricePaid"));
//		int deductedPoint = Integer.parseInt((String)paraMap.get("deductedPoint"));
//		int point = (Integer) paraMap.get("point");
//		String userid = (String)paraMap.get("userid");
//		
//		int result = 2 + (pdvList.size() * 2);
//		int cnt = 0;
//		
//		cnt += insertSlip(slip);
//		cnt += insertPurchaseDetail(pdvList);
//		cnt += updateMyPoint(paraMap);
//		cnt += deleteCart(paraMap);
//		
//		
//		
//		return result;
//	}
//	

	@Override
	public int insertSlip(SlipVO slip) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " insert into slip (slip_num, userid, store_id, purchase_day, slip_seq) " + 
						" values(?, ?, ?, sysdate, slip_seq.nextval) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, slip.getSlipNum());
			pstmt.setString(2, slip.getUserid());
			pstmt.setString(3, slip.getStoreId());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}

		return result;
	}

	@Override
	public int insertPurchaseDetail(List<PurchaseDetailVO> pdvoList) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " insert into purchase_detail (product_id, slip_num, userid, store_id, cnt, price, section, purchase_detail_seq) " + 
						" values(?, ?, ?, ?, ?, ?, ?, PURCHASE_DETAIL_SEQ.nextval) ";

			pstmt = conn.prepareStatement(sql);
			
			for(PurchaseDetailVO pdvo : pdvoList) {
				pstmt.setString(1, pdvo.getProductId());
				pstmt.setString(2, pdvo.getSlipNum());
				pstmt.setString(3, pdvo.getUserid());
				pstmt.setString(4, pdvo.getStoreId());
				pstmt.setInt(5, pdvo.getCnt());
				pstmt.setInt(6, pdvo.getPrice());
				pstmt.setInt(7, pdvo.getSection());
				
				result += pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
				
		return result;
	}

	@Override
	public int updateMyPoint(Map<String, Object> paramap) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " UPDATE starbucks_member " + 
						"  SET point = ? " + 
						"  where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			int pricePaid = Integer.parseInt((String)paramap.get("pricePaid"));
			int deductedPoint = Integer.parseInt((String)paramap.get("deductedPoint"));
			int point = (Integer) paramap.get("point");
			String userid = (String)paramap.get("userid");
			int updatedPoint = (int) ((point - deductedPoint) + Math.round((pricePaid * 0.05)));
			pstmt.setInt(1, updatedPoint);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}

	@Override
	public int deleteCart(Map<String, Object> paramap) throws SQLException {
		int result = 0;
		
		try {
			
		} finally {
			close();
		}
		
		return result;
	}
	
}
