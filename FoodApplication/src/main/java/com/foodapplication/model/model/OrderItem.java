package com.foodapplication.model.model;

public class OrderItem {
	private int orderItem;
	private int orderId;
	private int menuId;
	private int quantity;
	private int price;
	private int itemTotal;
	
	public int getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(int orderItem) {
		this.orderItem = orderItem;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(int itemTotal) {
		this.itemTotal = itemTotal;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public OrderItem(int orderItem, int orderId, int menuId, int quantity,int price,int itemTotal) {
		super();
		this.orderItem = orderItem;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.price = price;
		this.itemTotal = itemTotal;
	}
	public OrderItem(int orderId, int menuId, int quantity,int price, int itemTotal) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.price = price;
		this.itemTotal = itemTotal;
	}
	public OrderItem() {
		super();
	}
}
