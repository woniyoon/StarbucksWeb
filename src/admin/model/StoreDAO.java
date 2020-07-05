package admin.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import member.model.*;
import notice.model.NoticeVO;
import util.security.AES256;

public class StoreDAO implements InterStoreDAO {

	private DataSource ds; 	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes = null;
	
	// 생성자 
	public StoreDAO() {
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

	// 전체 매장 정보 가져오기
	@Override
	public List<StoreVO> selectPagingStore(HashMap<String, String> sMap) throws SQLException {
		
		List<StoreVO> storeList = new ArrayList<StoreVO>();
		
		try {
			conn = ds.getConnection();
						
			String sql = " select RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex "+
						 " from     "+
						 " ( "+
						 "    select rownum AS RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex "+
						 "    from  "+
						 "    ( "+
						 "    select store_id, store_sequence, store_name, address, url, latitude, longitude, zindex "+
						 "    from store_location "+
						 "    order by zindex asc "+
						 "    ) V "+
						 " ) T "+
						 " where T.RNO between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			
			int currentShowPageNo = Integer.parseInt(sMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(sMap.get("sizePerPage"));
			
		
			pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage -1 ) );// 공식
			pstmt.setInt(2, (currentShowPageNo * sizePerPage) );// 공식

			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreVO svo = new StoreVO();
				svo.setStore_id(rs.getString("store_id"));
				svo.setStore_sequence(rs.getInt("store_sequence"));
				svo.setStore_name(rs.getString("store_name"));
				svo.setAddress(rs.getString("address"));
				svo.setUrl(rs.getString("url"));
				svo.setLatitude(rs.getDouble("latitude"));
				svo.setLongitude(rs.getDouble("longitude"));
				svo.setZindex(rs.getInt("zindex"));
				
				storeList.add(svo);
			}
			
		} finally {
			close();
		}
		
		return storeList;

	}

	// 페이징 처리를 위한 전체매장에 대한 총 페이지개수 알아오기(select)
	@Override
	public int getTotalPage(HashMap<String, String> sMap) throws SQLException {
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/10) AS totalPage " +
						 " from store_location ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt("totalPage");
			
		} finally {
			close();
		}
		
		return totalPage;
	}
	
	
	
	// 페이징 처리를 위한 전체매장에 대한 총 페이지개수 알아오기(select)




	
}
