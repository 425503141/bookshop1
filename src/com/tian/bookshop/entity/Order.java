package com.tian.bookshop.entity;

public class Order {
	private int Id;
	private int price;
	private int OrderCount;
	private String OrderNumber;
	private int AdminCheck;
	private Book Book;
	private User User;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Book getBook() {
		return Book;
	}
	public void setBook(Book book) {
		Book = book;
	}
	public User getUser() {
		return User;
	}
	public void setUser(User user) {
		User = user;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOrderCount() {
		return OrderCount;
	}
	public void setOrderCount(int orderCount) {
		OrderCount = orderCount;
	}
	public String getOrderNumber() {
		return OrderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		OrderNumber = orderNumber;
	}
	public int getAdminCheck() {
		return AdminCheck;
	}
	public void setAdminCheck(int adminCheck) {
		AdminCheck = adminCheck;
	}
}
