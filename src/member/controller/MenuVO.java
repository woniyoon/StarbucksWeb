package member.controller;

public class MenuVO {

	private int my_menu_seq;
	private String userid;
	private String pname;
	private String register_day;
	private int section;
	
	public int getMy_menu_seq() {
		return my_menu_seq;
	}
	
	public void setMy_menu_seq(int my_menu_seq) {
		this.my_menu_seq = my_menu_seq;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getPname() {
		return pname;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public String getRegister_day() {
		return register_day;
	}
	
	public void setRegister_day(String register_day) {
		this.register_day = register_day;
	}
	
	public int getSection() {
		return section;
	}
	
	public void setSection(int section) {
		this.section = section;
	}
	
	
}
