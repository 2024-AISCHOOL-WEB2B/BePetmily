package com.model;

public class ImageDTO {
	private int imageId;
	private int postId;
	private int productId;
	private String imagePath;
	
	public ImageDTO(int productId) {
		this.productId = productId;
		
	}
	
	
	
}
