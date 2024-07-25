package com.model;

public class userDTO {
	// 한사람 회원의 정보를 저장하는 클래스
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	
	public userDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public userDTO(String id, String pw, String name, String email, String phone) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
