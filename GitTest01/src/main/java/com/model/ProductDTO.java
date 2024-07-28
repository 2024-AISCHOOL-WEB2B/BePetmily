package com.model;

public class ProductDTO {
	
	private int productId;
	private String productName;
	private String productPrice;
	private String productCate;
	private int stock;
	private String productUrl;	
	
	public ProductDTO(int productId, String productName, String productPrice, String productCate, int stock,
			String productUrl) {
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCate = productCate;
		this.stock = stock;
		this.productUrl = productUrl;
		
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductCate() {
		return productCate;
	}
	public void setProductCate(String productCate) {
		this.productCate = productCate;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getProductUrl() {
		return productUrl;
	}
	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}
	
	
	
}
