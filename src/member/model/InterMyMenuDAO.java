package member.model;

import java.sql.SQLException;
import java.util.List;

public interface InterMyMenuDAO {

	// 나의 메뉴 목록 불러오기
	List<MenuVO> selectMyMenu(String userid) throws SQLException;

}
