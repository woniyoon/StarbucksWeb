package product.model;

public class ProductVO {
	
	private String productId;
	private String categoryCode;
	private String productSeq;
	private String name;
	private String nameEng;
	private String description;
	private int price;
	private String img;
	private NutritionVO nutrition;
	
	
	public ProductVO() {
		
	}

	public ProductVO(String productId, String categoryCode, String productSeq, String name, String nameEng,
			String description, int price, String img) {
		super();
		this.productId = productId;
		this.categoryCode = categoryCode;
		this.productSeq = productSeq;
		this.name = name;
		this.nameEng = nameEng;
		this.description = description;
		this.price = price;
		this.img = img;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(String productSeq) {
		this.productSeq = productSeq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameEng() {
		return nameEng;
	}

	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public NutritionVO getNutrition() {
		return nutrition;
	}
	
	public void setNutrition(NutritionVO nutrition) {
		this.nutrition = nutrition;
	}
	
}
