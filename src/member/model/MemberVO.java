package member.model;

public class MemberVO {

	private String id;        // 회원아이디
	private String password;           // 비밀번호 (SHA-256 암호화 대상  단방향암호화)
	private String name;          // 회원명
	private String email;         // 이메일    (AES-256 암호화/복호화 대상  양방향암호화)
	private String phone;           // 휴대폰
	private int point;            // 포인트	
	private String gender;        // 성별     남자 : 1 / 여자 : 2
	private String Birthyyyy;     // 생년
	private String Birthmm;       // 생월
	private String Birthdd;       // 생일

	private String registerday;   // 가입일자
	private int status;           // 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
	
	public MemberVO() {}
	
	public MemberVO(String id, String password, String name, String email, String phone, int point, String gender,
			String Birthyyyy, String Birthmm, String Birthdd, String registerday, int status) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.point = point;
		this.gender = gender;
		this.Birthyyyy = Birthyyyy;
		this.Birthmm = Birthmm;
		this.Birthdd = Birthdd;
		this.registerday = registerday;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthyyyy() {
		return Birthyyyy;
	}

	public void setBirthyyyy(String birthyyyy) {
		this.Birthyyyy = birthyyyy;
	}

	public String getBirthmm() {
		return Birthmm;
	}

	public void setBirthmm(String birthmm) {
		this.Birthmm = birthmm;
	}

	public String getBirthdd() {
		return Birthdd;
	}

	public void setBirthdd(String birthdd) {
		this.Birthdd = birthdd;
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

