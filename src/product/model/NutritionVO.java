package product.model;

public class NutritionVO {
	
	private String productId; // 있어야 되는지 모르겠음
	private int nutritionSeq;
	private int kcal;
	private int sodium;
	private int cholesterol;
	private int sugar;
	private int protein;
	private String allergyTriggers = "";
	
	public NutritionVO() {
		
	}
	
	public NutritionVO(String productId, int nutritionSeq, int kcal, int sodium, int cholesterol, int sugar,
			int protein, String allergyTriggers) {
		super();
		this.productId = productId;
		this.nutritionSeq = nutritionSeq;
		this.kcal = kcal;
		this.sodium = sodium;
		this.cholesterol = cholesterol;
		this.sugar = sugar;
		this.protein = protein;
		this.allergyTriggers = allergyTriggers;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getNutritionSeq() {
		return nutritionSeq;
	}

	public void setNutritionSeq(int nutritionSeq) {
		this.nutritionSeq = nutritionSeq;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getSodium() {
		return sodium;
	}

	public void setSodium(int sodium) {
		this.sodium = sodium;
	}

	public int getCholesterol() {
		return cholesterol;
	}

	public void setCholesterol(int cholesterol) {
		this.cholesterol = cholesterol;
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public String getAllergyTriggers() {
		return allergyTriggers;
	}

	public void setAllergyTriggers(String allergyTriggers) {
		this.allergyTriggers = allergyTriggers;
	}
	
	
}
