package order.model;

public class SlipVO {

	private String slipNum;
	private String userid;
	private String storeId;
	private String purchaseDay;
	private int slipSeq;
	
	public SlipVO() {}
	
	public SlipVO(String slipNum, String userid, String storeId, String purchaseDay, int slipSeq) {
		super();
		this.slipNum = slipNum;
		this.userid = userid;
		this.storeId = storeId;
		this.purchaseDay = purchaseDay;
		this.slipSeq = slipSeq;
	}

	public String getSlipNum() {
		return slipNum;
	}

	public void setSlipNum(String slipNum) {
		this.slipNum = slipNum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getPurchaseDay() {
		return purchaseDay;
	}

	public void setPurchaseDay(String purchaseDay) {
		this.purchaseDay = purchaseDay;
	}

	public int getSlipSeq() {
		return slipSeq;
	}

	public void setSlipSeq(int slipSeq) {
		this.slipSeq = slipSeq;
	}
	
	
}
