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

import member.model.EncryptMyKey;
import util.security.AES256;

public class ProductDAO implements InterProductDAO {
	private DataSource ds; 
	// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다. 
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes = null;
	
	// 생성자 
	public ProductDAO() {
		// 암호화/복호화 키 (양방향암호화) ==> 이메일,휴대폰의 암호화/복호화
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
				 
				 productList.add(pvo); //productList에 pco를 담아라 list에
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		return productList;
	}
	
	
	@Override
	public List<ProductVO> getNutritionList() throws SQLException {
		
		List<ProductVO> nutritionList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			String sql = " (select product_id,name,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table "+
					" from drink f join nutrition n "+
					" on f.id = n.product_id) "+
					" union all "+
					" (select product_id,name,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table "+
					" from food f join nutrition n "+
					" on f.id = n.product_id) ";
			
			pstmt = conn.prepareStatement(sql);
			 
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
				 String product_id = rs.getString("product_id");    
				 String name = rs.getString("name");         
				 int nutrition_seq = rs.getInt("nutrition_seq"); 
				 int kcal = rs.getInt("kcal"); 
				 int sodium = rs.getInt("sodium");          		
				 int cholesterol = rs.getInt("cholesterol");          
				 int    sugar = rs.getInt("sugar");                    
				 int protein = rs.getInt("protein");  
				 String allergy_triggers = rs.getString("allergy_triggers");          		
				 String parent_table = rs.getString("parent_table");      
				 
			 	ProductVO pvo = new ProductVO(); 
				 
			 	nutritionList.add(pvo);
			}
		} finally {
			close();
		}
		return nutritionList;
		
	
	}

}
