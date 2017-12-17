package com.tian.bookshop.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="book")
public class Book {
	private int id;
	private String name;
	private String Publisher;
	private String Author;
	private int price;
	private String content;
	private String imageFile;
	@Id
	@GeneratedValue(generator="x")
	@GenericGenerator(name = "x", strategy = "identity")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String nname) {
		name = nname;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int m_price) {
		price = m_price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getimageFile() {
		return imageFile;
	}
	public void setimageFile(String imagefile) {
		imageFile = imagefile;
	}
}
