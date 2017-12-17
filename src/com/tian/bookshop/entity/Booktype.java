package com.tian.bookshop.entity;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="booktype")
public class Booktype {
	private int TypeId;
	private String typename;
	@Id
	@GeneratedValue(generator="x")
	@GenericGenerator(name = "x", strategy = "identity")
	public int getTypeId() {
		return TypeId;
	}
	public void setTypeId(int typeId) {
		TypeId = typeId;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
}
