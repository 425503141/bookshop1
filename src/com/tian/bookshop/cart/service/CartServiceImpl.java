package com.tian.bookshop.cart.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tian.bookshop.cart.dao.CartDaoImpl;
import com.tian.bookshop.entity.Book;
import com.tian.bookshop.entity.Shoppingcart;
import com.tian.bookshop.entity.User;
@Service
@Transactional(readOnly=true)
public class CartServiceImpl {
	@Resource
	private CartDaoImpl CartDaoImpl;
	
	public List<Shoppingcart> listAll(){
		return this.CartDaoImpl.findAll();
	}
	public List<Shoppingcart> findByUser(int userid){
		return this.CartDaoImpl.findByUser(userid);
	}
	public int findQuantity(int userid,int bookid) {
		return this.CartDaoImpl.findQuantityById(userid, bookid);
	}
	public Shoppingcart findByRecord(int userid,int bookid) {
		return this.CartDaoImpl.findByRecord(userid, bookid);
	}
	public void updateQuantity(int userid,int bookid) {
		int count = this.CartDaoImpl.findByRecord(userid, bookid).getQuantity() + 1;
		this.CartDaoImpl.update(userid, bookid, count);
	}
	public void freshQuantity(int userid,int bookid,int count) {
		this.CartDaoImpl.update(userid, bookid, count);
	}
	public void insert(int userid,int bookid,String bookname,String bookauthor,int bookprice,String bookimage) {
		this.CartDaoImpl.save(userid,bookid,bookname,bookauthor,bookprice,bookimage);
	}
	public void delete(int userid,int bookid) {
		this.CartDaoImpl.delete(userid, bookid);
	}
	public void deleteByid(int id) {
		this.CartDaoImpl.deleteByid(id);
	}
}
