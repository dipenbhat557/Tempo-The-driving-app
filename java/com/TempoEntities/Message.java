package com.TempoEntities;

public class Message {
	private String cssClass;
	private String content;
	
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Message() {
		
	}
	
	public Message(String cssClass, String content) {
		super();
		this.cssClass = cssClass;
		this.content = content;
	}
	
	
}
