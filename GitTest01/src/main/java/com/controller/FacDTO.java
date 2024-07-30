package com.controller;

public class FacDTO {
	private int facId;
	private String facName;
	private String facLat;
	private String facLon;
	private String facCategory;
	private String facAddress;
	private String facTel;
	
	
	public FacDTO(int facId, String facName, String facLat, String facLon, String facCategory, String facAddress,
			String facTel) {
		this.facId = facId;
		this.facName = facName;
		this.facLat = facLat;
		this.facLon = facLon;
		this.facCategory = facCategory;
		this.facAddress = facAddress;
		this.facTel = facTel;
	}		

	public int getFacId() {
		return facId;
	}
	public void setFacId(int facId) {
		this.facId = facId;
	}
	public String getFacName() {
		return facName;
	}
	public void setFacName(String facName) {
		this.facName = facName;
	}
	public String getFacLat() {
		return facLat;
	}
	public void setFacLat(String facLat) {
		this.facLat = facLat;
	}
	public String getFacLon() {
		return facLon;
	}
	public void setFacLon(String facLon) {
		this.facLon = facLon;
	}
	public String getFacCategory() {
		return facCategory;
	}
	public void setFacCategory(String facCategory) {
		this.facCategory = facCategory;
	}
	public String getFacAddress() {
		return facAddress;
	}
	public void setFacAddress(String facAddress) {
		this.facAddress = facAddress;
	}
	public String getFacTel() {
		return facTel;
	}
	public void setFacTel(String facTel) {
		this.facTel = facTel;
	}
	
	
}
