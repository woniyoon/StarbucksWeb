package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MyMenuDAO implements InterMyMenuDAO {

	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MyMenuDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null)    {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 나의 음료 메뉴 목록 불러오기
	@Override
	public List<MenuVO> selectMyMenu(String userid) throws SQLException {

		List<MenuVO> menuList = new ArrayList<>();
	
		try {
			
			conn = ds.getConnection();
			String sql = " select section, my_menu_seq, product_name, to_char(register_day, 'yyyy-mm-dd hh24:mi:ss') as register_day "+
 						 " from favorite_menu "+
						 " where userid= ? "+
						 " order by register_day asc ";			

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MenuVO mvo = new MenuVO();
				mvo.setMy_menu_seq(rs.getInt("my_menu_seq"));
				mvo.setPname(rs.getString("product_name"));
				mvo.setRegister_day(rs.getString("register_day"));
				mvo.setSection(rs.getInt("section"));
				
				System.out.println(rs.getInt("section"));
				menuList.add(mvo);
			}
		} finally {
			
			close();
		}

		return menuList;
	
	}
	
	

}
