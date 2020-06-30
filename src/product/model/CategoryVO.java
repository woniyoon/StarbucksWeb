package product.model;

public class CategoryVO {

	private String categoryId;
	private String categoryName;
	private int categorySeq;
	
	public CategoryVO() {
		
	}
	
	public CategoryVO(String categoryId, String categoryName, int categorySeq) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categorySeq = categorySeq;
	}

	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	
}
