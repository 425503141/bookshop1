package com.tian.bookshop.entity;

public class Log {
	private User User;
	private String LoginTime;
	public User getUser() {
		return User;
	}
	public void setUser(User user) {
		User = user;
	}
	public String getLoginTime() {
		return LoginTime;
	}
	public void setLoginTime(String loginTime) {
		LoginTime = loginTime;
	}
}
