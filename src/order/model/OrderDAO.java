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
//		ShoppingCartVO shoppingCart = null;
		List<ProductVO> items = new ArrayList<ProductVO>();
		
		try {
//			shoppingCart = new ShoppingCartVO();

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
				
				System.out.println("productID  : "+ productID);
				System.out.println("parentTable  : "+ parentTable);
				System.out.println("getShoppingCart() : " + items.size());
				
				if("food".equals(parentTable)) {
					System.out.println("food!");
					FoodVO fvo = getFoodInfo(productID);
					items.add(fvo);
				} else {
					System.out.println("drink!");

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

		String sql = " select id, name, price, img from food where id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productID);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			fvo = new FoodVO();
			fvo.setProductId(rs.getString("id"));
			fvo.setName(rs.getString("name"));
			fvo.setPrice(rs.getInt("price"));
			fvo.setImg(rs.getString("img"));
		}
			
		return fvo;
	}



	@Override
	public DrinkVO getDrinkInfo(String productID) throws SQLException {
		
		DrinkVO dvo = null;
		
		conn = ds.getConnection();
		String sql = " select id, name, price, img, shot, syrup, whipped_cream, temperature, base "
					+ "from drink where id = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productID);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dvo = new DrinkVO();
			dvo.setProductId(rs.getString("id"));
			dvo.setName(rs.getString("name"));
			dvo.setPrice(rs.getInt("price"));
			dvo.setImg(rs.getString("img"));
			dvo.setShot(rs.getInt("shot"));
			dvo.setSyrup(rs.getString("syrup"));
			dvo.setWhippedCream(rs.getString("whipped_cream"));
			dvo.setTemperature(rs.getString("temperature"));
			dvo.setBase(rs.getString("base"));
		}
		
		return dvo;
	}
	
}
