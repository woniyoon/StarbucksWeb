package feedback.model;

public class FeedbackListVO {

	private int rno;			      // 고객의소리 글번호
	private int feedback_board_seq;   // 고객의소리시퀀스
	private String store_id;          // 매장아이디
	private String visit_day;		  // 매장방문일
	private String userid;            // 아이디
	private String category;          // 주제 (문의,칭찬,제안,불만)
	private String title;             // 글제목  
	private String contents;          // 내용
	private String hp1;               // 연락처
	private String hp2;               // 연락처         
	private String hp3;               // 연락처    
	private String file_attached;     // 첨부파일1
	private String file_attached2;    // 첨부파일2
	private int hit;                  // 조회수
	private String username;          // 작성자
	private String write_day;         // 작성일
	private String status;			  // 상태(접수중,완료)
	
	public FeedbackListVO() {}
	
	public FeedbackListVO(int rno, int feedback_board_seq, String store_id, String visit_day, String userid, String category, String title,
			String contents, String hp1, String hp2, String hp3, String file_attached, String file_attached2, int hit, String username,
			String write_day, String status) {
		super();
		this.rno = rno;
		this.feedback_board_seq = feedback_board_seq;
		this.store_id = store_id;
		this.visit_day = visit_day;
		this.userid = userid;
		this.category = category;
		this.title = title;
		this.contents = contents;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.file_attached = file_attached;
		this.file_attached2 = file_attached2;
		this.hit = hit;
		this.username = username;
		this.write_day = write_day;
		this.status = status;
	}


	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getFeedback_board_seq() {
		return feedback_board_seq;
	}

	public void setFeedback_board_seq(int feedback_board_seq) {
		this.feedback_board_seq = feedback_board_seq;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	

	public String getVisit_day() {
		return visit_day;
	}

	public void setVisit_day(String visit_day) {
		this.visit_day = visit_day;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public String getFile_attached() {
		return file_attached;
	}

	public void setFile_attached(String file_attached) {
		this.file_attached = file_attached;
	}
	
	public String getFile_attached2() {
		return file_attached2;
	}

	public void setFile_attached2(String file_attached2) {
		this.file_attached2 = file_attached2;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getWrite_day() {
		return write_day;
	}

	public void setWrite_day(String write_day) {
		this.write_day = write_day;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}
