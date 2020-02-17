package com.spring.shop_project;

public class SessionVO {
	String id;
	String authlevel;
	int admin_active;
	
	
	
	public int getAdmin_active() {
		return admin_active;
	}
	public void setAdmin_active(int admin_active) {
		this.admin_active = admin_active;
	}
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
