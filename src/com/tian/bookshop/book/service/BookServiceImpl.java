package com.tian.bookshop.book.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tian.bookshop.book.dao.BookDaoImpl;
import com.tian.bookshop.entity.Book;

@Service
@Transactional(readOnly=true)
public class BookServiceImpl {

	@Resource
	private BookDaoImpl bookDaoImpl;
	
	public List<Book> listAll(){
		return this.bookDaoImpl.findAll();
	}
	public Book findId(int id) {
		return this.bookDaoImpl.findByid(id);
	}
}
