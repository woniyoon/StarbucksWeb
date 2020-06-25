package member.model;

import java.sql.SQLException;
import java.util.HashMap;

public interface InterMemberDAO {

	// 회원가입(insert)
	int registerMember(MemberVO membervo) throws SQLException;

	// ID중복 검사 (userid가 중복이 없어서 사용가능하다라면 true, userid가 이미 존재하여 사용 불가능하면 false 를 리턴) 
	boolean idDuplicateCheck(String userid) throws SQLException;

	// 아이디와 암호를 입력받아서 그 회원에 대한 정보를 리턴(로그인처리)
	MemberVO selectOneMember(HashMap<String, String> paraMap) throws SQLException;
	
	// 비밀번호 변경
	String selectPasswd(String userid) throws SQLException;

	int updatePasswd(String userid, String newPassword) throws SQLException;

	
}
