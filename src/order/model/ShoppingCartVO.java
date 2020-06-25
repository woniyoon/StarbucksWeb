package order.model;

import java.util.List;

import product.model.ProductVO;

public class ShoppingCartVO {

	private String userid;
	private String itemSeq;
	private ProductVO product;
	
	public ShoppingCartVO() {
		
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getItemSeq() {
		return itemSeq;
	}
	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}
	public ProductVO getProduct() {
		return product;
	}
	public void setCart(ProductVO product) {
		this.product = product;
	}
	
}
