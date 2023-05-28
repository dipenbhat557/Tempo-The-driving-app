package com.TempoEntities;

public class User {

	private int uId;
	private String name;
	private String phoneno;
	private String gender;
	private String email;
	private String password;
	private String liscenceName;
	private String profileName;
	private String category;

	public User() {

	}

	public User(int uId, String name, String phoneno, String gender, String email,
			String password, String liscenceName, String profileName, String category) {
		super();
		this.uId = uId;
		this.name = name;
		this.phoneno = phoneno;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.liscenceName = liscenceName;
		this.profileName = profileName;
		this.category = category;
	}

	public User(String name, String phoneno, String gender, String email, String password,
			String liscenceName, String profileName, String category) {
		super();
		this.name = name;
		this.phoneno = phoneno;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.liscenceName = liscenceName;
		this.profileName = profileName;
		this.category = category;
	}
	
	

	public User(int uId, String name, String phoneno, String gender, String email, String password, String profileName,
			String category) {
		super();
		this.uId = uId;
		this.name = name;
		this.phoneno = phoneno;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.profileName = profileName;
		this.category = category;
	}
	
	

	public User(String name, String phoneno, String gender, String email, String password, String profileName,
			String category) {
		super();
		this.name = name;
		this.phoneno = phoneno;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.profileName = profileName;
		this.category = category;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLiscenceName() {
		return liscenceName;
	}

	public void setLiscenceName(String liscenceName) {
		this.liscenceName = liscenceName;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
