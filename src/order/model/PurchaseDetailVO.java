package order.model;

public class PurchaseDetailVO {

	private String productId;
	private String slipNum;
	private String userid;
	private String storeId;
	private int cnt;
	private int price;
	private int section;
	private int purchaseDetailSeq;
	
	public PurchaseDetailVO() {}
	
	public PurchaseDetailVO(String productId, String slipNum, String userid, String storeId, int cnt, int price,
			int section, int purchaseDetailSeq) {
		super();
		this.productId = productId;
		this.slipNum = slipNum;
		this.userid = userid;
		this.storeId = storeId;
		this.cnt = cnt;
		this.price = price;
		this.section = section;
		this.purchaseDetailSeq = purchaseDetailSeq;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public int getPurchaseDetailSeq() {
		return purchaseDetailSeq;
	}

	public void setPurchaseDetailSeq(int purchaseDetailSeq) {
		this.purchaseDetailSeq = purchaseDetailSeq;
	}
	
	
	
}
