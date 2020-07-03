package product.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.*;
import util.security.AES256;

public class ProductDAO implements InterProductDAO {
	private DataSource ds; 	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes = null;
	
	// 생성자 
	public ProductDAO() {
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
	
	
	
	
	// product list
	@Override
	public List<ProductVO> getProductList() throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		try {
			 conn = ds.getConnection();
			 
			 String sql = " (select N.parent_table, id, category_id, name, name_eng, description, price, img "+
					 " from drink D, nutrition N "+
					 " where D.id = N.product_id) "+
					 " union all "+
					 " (select N.parent_table, id, category_id, name, name_eng, description, price, img "+
					 " from food F, nutrition N "+
					 " where F.id = N.product_id) ";
			 
			 pstmt = conn.prepareStatement(sql);
			 
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 
				 String parent_table = rs.getString("parent_table");    
				 String id = rs.getString("id");         
				 String category_id = rs.getString("category_id"); 
				 String name = rs.getString("name"); 
				 String name_eng = rs.getString("name_eng");          		
				 String description = rs.getString("description");          
				 int    price= rs.getInt("price");                    
				 String img = rs.getString("img");  
				 
				 ProductVO pvo = new ProductVO(parent_table, id, category_id, name, name_eng, description, price, img); 
				 
				 productList.add(pvo); 
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		return productList;
	}
	
	// nutrition list
	@Override
	public NutritionVO getNutritionInfo(String productId) throws SQLException {
		NutritionVO nvo = new NutritionVO();
		
		try {
			conn = ds.getConnection();
			 
			String sql = " select product_id,nutrition_Seq,kcal,sodium,cholesterol,sugar, protein,allergy_Triggers " +
					" from nutrition " +
					" where product_id = ? ";
			 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nvo.setProductId(rs.getString("product_id"));
				nvo.setNutritionSeq(rs.getInt("nutrition_seq"));
				nvo.setKcal(rs.getInt("kcal"));
				nvo.setSodium(rs.getInt("sodium"));
				nvo.setCholesterol(rs.getInt("cholesterol"));
				nvo.setSugar(rs.getInt("sugar"));
				nvo.setProtein(rs.getInt("protein"));
				nvo.setAllergyTriggers(rs.getString("allergy_Triggers"));
			}
			
			
		} finally {
			close();
		}
		
		return nvo;
	}
	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기 (드링크) 
	@Override
	public ProductVO selectOneDrinkByID(String type, String productId) throws SQLException{
		
		DrinkVO pvo = new DrinkVO();
		String sql = "";
		try {
			 conn = ds.getConnection();
		 
			sql = " select C.category_name, A.product_id, A.kcal, A.sodium, A.cholesterol, A.sugar, A.protein, A.caffein, A.allergy_triggers, A.name, A.name_eng, A.description, A.img "+
				 " from "+
				 " (select * "+
				 " from drink D, nutrition N "+
				 " where D.id = N.product_id and D.id = ? ) A, product_category C "+
				 " where A.category_id = C.category_id ";
				 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, productId);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 String category_name = rs.getString("category_name");    
				 String product_id = rs.getString("product_id");         
				 int 	kcal = rs.getInt("kcal"); 
				 int 	sodium = rs.getInt("sodium"); 
				 int 	cholesterol = rs.getInt("cholesterol");          		
				 int 	sugar = rs.getInt("sugar");          
				 int 	protein= rs.getInt("protein");                    
				 int 	caffein = rs.getInt("caffein");  
				 String allergy_triggers = rs.getString("allergy_triggers");  
				 String name = rs.getString("name");  
				 String name_eng = rs.getString("name_eng");  
				 String description = rs.getString("description");  
				 String img = rs.getString("img");  
				
				 pvo.setParentTable(type); 
				 pvo.setCategoryName(category_name);
				 pvo.setProductId(product_id);
				 pvo.setCaffein(caffein);
				 pvo.setName(name);
				 pvo.setNameEng(name_eng);
				 pvo.setDescription(description);
				 pvo.setImg(img);
				
				 NutritionVO nvo = new NutritionVO();
				 nvo.setKcal(kcal);
				 nvo.setSodium(sodium);
				 nvo.setCholesterol(cholesterol);
				 nvo.setSugar(sugar);
				 nvo.setProtein(protein);
				 nvo.setAllergyTriggers(allergy_triggers);
				 
				 pvo.setNutrition(nvo);
				 
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		
		return pvo;		
		
	}
	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기 (푸드) 
	@Override
	public ProductVO selectOneFoodByID(String type, String productId) throws SQLException {
		FoodVO pvo = new FoodVO();
		String sql = "";
		try {
			 conn = ds.getConnection();
			 
			 sql = " select C.category_name, A.product_id, A.kcal, A.sodium, A.cholesterol, A.sugar, A.protein, A.allergy_triggers, A.name, A.name_eng, A.description, A.img\n"+
					 " from "+
					 " (select * "+
					 " from food F, nutrition N "+
					 " where F.id = N.product_id and F.id = ? ) A, product_category C "+
					 " where A.category_id = C.category_id ";
				 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, productId);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 String category_name = rs.getString("category_name");    
				 String product_id = rs.getString("product_id");         
				 int 	kcal = rs.getInt("kcal"); 
				 int 	sodium = rs.getInt("sodium"); 
				 int 	cholesterol = rs.getInt("cholesterol");          		
				 int 	sugar = rs.getInt("sugar");          
				 int 	protein= rs.getInt("protein");                    
				 String allergy_triggers = rs.getString("allergy_triggers");  
				 String name = rs.getString("name");  
				 String name_eng = rs.getString("name_eng");  
				 String description = rs.getString("description");  
				 String img = rs.getString("img");  
				
				 pvo.setParentTable(type); 
				 pvo.setCategoryName(category_name);
				 pvo.setProductId(product_id);
				 pvo.setName(name);
				 pvo.setNameEng(name_eng);
				 pvo.setDescription(description);
				 pvo.setImg(img);
				
				 NutritionVO nvo = new NutritionVO();
				 nvo.setKcal(kcal);
				 nvo.setSodium(sodium);
				 nvo.setCholesterol(cholesterol);
				 nvo.setSugar(sugar);
				 nvo.setProtein(protein);
				 nvo.setAllergyTriggers(allergy_triggers);
				 
				 pvo.setNutrition(nvo);
				 
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		
		return pvo;		
	}	
	
	// 마이메뉴 추가하기
	@Override
	public int addMyMenu(HashMap<String, String> paraMap)  throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " insert into favorite_menu(userid, product_id, my_menu_seq, product_name, register_day, section) "+
					 " values(?, ?, favorite_menu_seq.nextval, ?, sysdate, ?) ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, paraMap.get("userid"));
			 pstmt.setString(2, paraMap.get("productId"));
			 pstmt.setString(3, paraMap.get("productName"));
			 pstmt.setInt(4, Integer.parseInt(paraMap.get("section")));
		 
			 result = pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
		return result;
	}
	
	// 장바구니 추가하기
	@Override
	public int addCart(HashMap<String, String> paraMap)  throws SQLException {
		
		int result = 0;
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " insert into shoppingcart(shoppingcart_seq, userid, product_id, status) "+
					 " values(shoppingcart_seq.nextval, ?, ?, ?) ";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, paraMap.get("userid"));
			 pstmt.setString(2, paraMap.get("productId"));
			 pstmt.setInt(3, 1);
//			 pstmt.setInt(3, Integer.parseInt(paraMap.get("status")));
//			 pstmt.setString(4, paraMap.get("custom"));
//			 pstmt.setInt(5, Integer.parseInt(paraMap.get("final_price")));
			 
			 result = pstmt.executeUpdate();
			 
		} finally {
			close();
		}
		
		return result;
	}
	
}
