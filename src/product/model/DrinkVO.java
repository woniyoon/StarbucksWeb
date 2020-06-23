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

	public int getShot() {
		return shot;
	}

	public void setShot(int shot) {
		this.shot = shot;
	}

	public String getSyrup() {
		return syrup;
	}

	public void setSyrup(String syrup) {
		this.syrup = syrup;
	}

	public String getWhippedCream() {
		return whippedCream;
	}

	public void setWhippedCream(String whippedCream) {
		this.whippedCream = whippedCream;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public int getCaffein() {
		return caffein;
	}

	public void setCaffein(int caffein) {
		this.caffein = caffein;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}
}
