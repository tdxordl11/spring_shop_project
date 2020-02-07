package com.spring.shop_project;

public class SessionVO {
	String id;
	String authlevel;
	
	public String getId() {
		return id;
	}
	@Override
	public String toString() {
		return getId();
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuthlevel() {
		return authlevel;
	}
	public void setAuthlevel(String authlevel) {
		this.authlevel = authlevel;
	}
	
}
