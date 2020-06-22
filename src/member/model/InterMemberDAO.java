package member.model;

import java.sql.SQLException;

public interface InterMemberDAO {

	// 회원가입(insert)
	int registerMember(MemberVO membervo) throws SQLException;

	// ID중복 검사 (userid가 중복이 없어서 사용가능하다라면 true, userid가 이미 존재하여 사용 불가능하면 false 를 리턴) 
	boolean idDuplicateCheck(String userid) throws SQLException;

	
}
