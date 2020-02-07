package com.spring.shop_project;

import org.springframework.stereotype.Component;

@Component
public class AdminVO {
	String admin_id;
	String admin_password;
	String admin_phone;
	String admin_name;
	String admin_address;
	String admin_otpkey;
	String admin_authlevel;
	int admin_active;
	
	public int getAdmin_active() {
		return admin_active;
	}
	public void setAdmin_active(int admin_active) {
		this.admin_active = admin_active;
	}
	public String getAdmin_authlevel() {
		return admin_authlevel;
	}
	public void setAdmin_authlevel(String admin_authlevel) {
		this.admin_authlevel = admin_authlevel;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getAdmin_address() {
		return admin_address;
	}
	public void setAdmin_address(String admin_address) {
		this.admin_address = admin_address;
	}
	public String getAdmin_otpkey() {
		return admin_otpkey;
	}
	public void setAdmin_otpkey(String admin_otpkey) {
		this.admin_otpkey = admin_otpkey;
	}
	
}
