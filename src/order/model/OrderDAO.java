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
	
}
