package admin.model;

import java.sql.SQLException;
import java.util.*;

import member.model.MemberVO;
import product.model.ProductVO;

public interface InterAdminDAO {

	// 전체 회원 목록 가져오기
	List<MemberVO> getAllMembers(HashMap<String, String> paraMap) throws SQLException;
	
	// 전체 회원 수 가져오기
	int getNumOfMems() throws SQLException;

	// 전체 음료 목록 가져오기
	List<ProductVO> getDrinkList(HashMap<String, String> paramap) throws SQLException;
	
	//
}
