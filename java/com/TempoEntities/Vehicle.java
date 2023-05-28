package com.TempoEntities;

public class Vehicle {
	private int vId;
	private String vType;
	private String vModel;
	private String vPlate;
	private String vPhoto;
	private int userId;
	
	public Vehicle(int vId, String vType, String vModel, String vPlate, String vPhoto, int userId) {
		super();
		this.vId = vId;
		this.vType = vType;
		this.vModel = vModel;
		this.vPlate = vPlate;
		this.vPhoto = vPhoto;
		this.userId = userId;
	}
	
	public Vehicle(String vType, String vModel, String vPlate, String vPhoto, int userId) {
		super();
		this.vType = vType;
		this.vModel = vModel;
		this.vPlate = vPlate;
		this.vPhoto = vPhoto;
		this.userId = userId;
	}

	public Vehicle() {
		
	}
	
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public String getvType() {
		return vType;
	}
	public void setvType(String vType) {
		this.vType = vType;
	}
	public String getvModel() {
		return vModel;
	}
	public void setvModel(String vModel) {
		this.vModel = vModel;
	}
	public String getvPlate() {
		return vPlate;
	}
	public void setvPlate(String vPlate) {
		this.vPlate = vPlate;
	}
	public String getvPhoto() {
		return vPhoto;
	}
	public void setvPhoto(String vPhoto) {
		this.vPhoto = vPhoto;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
}
