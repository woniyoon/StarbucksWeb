package product.model;

public class DrinkVO extends ProductVO {
	private int shot;
	private String syrup;
	private String whippedCream;
	private String temperature;
	private int caffein;
	private String base;
	
	public DrinkVO() {
		super();
	}
	
	public DrinkVO(int shot, String syrup, String whippedCream, String temperature, int caffein, String base) {
		super();
		this.shot = shot;
		this.syrup = syrup;
		this.whippedCream = whippedCream;
		this.temperature = temperature;
		this.caffein = caffein;
		this.base = base;
	}
}
