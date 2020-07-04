package admin.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterStoreDAO {

	// 전체 매장 정보 가져오기
	List<StoreVO> selectPagingStore(HashMap<String, String> sMap) throws SQLException;

	// 페이징 처리를 위한 전체매장에 대한 총 페이지개수 알아오기(select)
	int getTotalPage(HashMap<String, String> sMap) throws SQLException;

	
	
}
