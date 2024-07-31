package com.model;

public class DisDTO {

	private String disName;
	private String disTreat;
	private String disInfo;

	public DisDTO(String disName, String disTreat, String disInfo) {
		this.disName = disName;
		this.disTreat = disTreat;
		this.disInfo = disInfo;

	}

	public String getDisName() {
		return disName;
	}

	public void setDisName(String disName) {
		this.disName = disName;
	}

	public String getDisTreat() {
		return disTreat;
	}

	public void setDisTreat(String disTreat) {
		this.disTreat = disTreat;
	}

	public String getDisInfo() {
		return disInfo;
	}

	public void setDisInfo(String disInfo) {
		this.disInfo = disInfo;
	}

}
