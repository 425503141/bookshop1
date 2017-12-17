package com.tian.bookshop.book.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tian.bookshop.entity.Book;

@Repository
public class BookDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	public List<Book> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Book");
		return q.list();
	}
	public Book findByid(int id) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Book where id = ?").setParameter(0, id);
		return (Book)q.uniqueResult();
	}
}      