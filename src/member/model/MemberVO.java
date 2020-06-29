package member.model;

public class MemberVO {

	private int Member_seq;       // 회원번호(시퀀스로 데이터가 들어온다)
	private String userid;        	  // 회원아이디
	private String password;      // 비밀번호 (SHA-256 암호화 대상  단방향암호화)
	private String name;          // 회원명
	private String email;         // 이메일    (AES-256 암호화/복호화 대상  양방향암호화)
	private String hp1;           // 휴대폰
	private String hp2;           //       
	private String hp3;           //       
	private int point;            // 포인트	
	private int gender;        // 성별     남자 : 1 / 여자 : 2
	private String Birthyyyy;     // 생년
	private String Birthmm;       // 생월
	private String Birthdd;       // 생일

	private String registerday;   // 가입일자
	private int status;           // 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
	
	public MemberVO() {}

	public MemberVO(int member_seq, String userid, String password, String name, String email, String hp1, String hp2,
			String hp3, int point, int gender, String birthyyyy, String birthmm, String birthdd, String registerday,
			int status) {
		super();
		Member_seq = member_seq;
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.point = point;
		this.gender = gender;
		Birthyyyy = birthyyyy;
		Birthmm = birthmm;
		Birthdd = birthdd;
		this.registerday = registerday;
		this.status = status;
	}
	
	public int getMember_seq() {
		return Member_seq;
	}

	public void setMember_seq(int member_seq) {
		Member_seq = member_seq;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirthyyyy() {
		return Birthyyyy;
	}

	public void setBirthyyyy(String birthyyyy) {
		Birthyyyy = birthyyyy;
	}

	public String getBirthmm() {
		return Birthmm;
	}

	public void setBirthmm(String birthmm) {
		Birthmm = birthmm;
	}

	public String getBirthdd() {
		return Birthdd;
	}

	public void setBirthdd(String birthdd) {
		Birthdd = birthdd;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
	

}	
	
	
	
	

	