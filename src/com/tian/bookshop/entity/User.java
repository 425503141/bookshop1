package com.tian.bookshop.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="user")
public class User {
	private int id;
	private int shoppingcartid;
	private String Password;
	private String username;
	private String sex;
	private String address;
	
	@Id
	@GeneratedValue(generator="x")
	@GenericGenerator(name = "x", strategy = "native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String userName) {
		username = userName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String m_sex) {
		sex = m_sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getShoppingcartid() {
		return shoppingcartid;
	}
	public void setShoppingcartid(int shoppingcartid) {
		this.shoppingcartid = shoppingcartid;
	}
	
}
