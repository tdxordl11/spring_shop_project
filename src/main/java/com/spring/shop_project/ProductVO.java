package com.spring.shop_project;

import java.util.Date;

public class ProductVO {
	String product_detail;
	int product_price;
	String convert_price;
	String product_balance;
	String product_sellcount;
	String product_category;
	String product_brand;
	String product_name;
	String product_id;
	String product_image;
	String product_release;
	int sales_persent;
	Date sales_date;
	
	
	public String getConvert_price() {
		return convert_price;
	}
	public void setConvert_price(String convert_price) {
		this.convert_price = convert_price;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_balance() {
		return product_balance;
	}
	public void setProduct_balance(String product_balance) {
		this.product_balance = product_balance;
	}
	public String getProduct_sellcount() {
		return product_sellcount;
	}
	public void setProduct_sellcount(String product_sellcount) {
		this.product_sellcount = product_sellcount;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_release() {
		return product_release;
	}
	public void setProduct_release(String product_release) {
		this.product_release = product_release;
	}
	public int getSales_persent() {
		return sales_persent;
	}
	public void setSales_persent(int sales_persent) {
		this.sales_persent = sales_persent;
	}
	public Date getSales_date() {
		return sales_date;
	}
	public void setSales_date(Date sales_date) {
		this.sales_date = sales_date;
	}
	
}
