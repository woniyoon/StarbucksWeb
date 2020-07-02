package order.model;

public class LocationVO {

	private String storeID;
	private String storeName;
	private String address;
	private Double latitude;
	private Double longitude;
	private String url;
	private int zIndex;

	
	public LocationVO() {}

	public String getStoreID() {
		return storeID;
	}

	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getzIndex() {
		return zIndex;
	}

	public void setzIndex(int zIndex) {
		this.zIndex = zIndex;
	}
	
	
	
}
