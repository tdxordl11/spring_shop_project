package com.spring.shop_project;

public class OrderVO {

	int order_seq;
	String order_id;           
	int order_balance;        
	int order_price;          
	String order_payment;       
	String product_id;  
	String product_name;
	String user_id;              
	String order_date;         
	String shipment_address;     
	String shipment_zipcode;    
	String order_invoice;
	int totaldayincome;
	int monthincomeperproduct;
	int monthtotal;
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getOrder_balance() {
		return order_balance;
	}
	public void setOrder_balance(int order_balance) {
		this.order_balance = order_balance;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getShipment_address() {
		return shipment_address;
	}
	public void setShipment_address(String shipment_address) {
		this.shipment_address = shipment_address;
	}
	public String getShipment_zipcode() {
		return shipment_zipcode;
	}
	public void setShipment_zipcode(String shipment_zipcode) {
		this.shipment_zipcode = shipment_zipcode;
	}
	public String getOrder_invoice() {
		return order_invoice;
	}
	public void setOrder_invoice(String order_invoice) {
		this.order_invoice = order_invoice;
	}
	public int getTotaldayincome() {
		return totaldayincome;
	}
	public void setTotaldayincome(int totaldayincome) {
		this.totaldayincome = totaldayincome;
	}
	public int getMonthincomeperproduct() {
		return monthincomeperproduct;
	}
	public void setMonthincomeperproduct(int monthincomeperproduct) {
		this.monthincomeperproduct = monthincomeperproduct;
	}
	public int getMonthtotal() {
		return monthtotal;
	}
	public void setMonthtotal(int monthtotal) {
		this.monthtotal = monthtotal;
	}
	
   
	
	
	
	
}
