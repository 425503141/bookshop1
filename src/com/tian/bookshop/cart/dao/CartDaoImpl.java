package com.tian.bookshop.cart.dao;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tian.bookshop.entity.Book;
import com.tian.bookshop.entity.Shoppingcart;
import com.tian.bookshop.entity.User;
@Repository
public class CartDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Shoppingcart> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Shoppingcart");
		return q.list();
	}
	public List<Shoppingcart> findByUser(int userid) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Shoppingcart where userid = ?");
		
		return q.setParameter(0, userid).list();
	}
	public int findQuantityById(int userid,int bookid) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("select quantity from Shoppingcart c where c.userid = ? and c.bookid = ?");
		q.setParameter(0, userid);
		q.setParameter(1, bookid);
		return (int)q.uniqueResult();
	}
	public Shoppingcart findByRecord(int userid,int bookid) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Shoppingcart where userid = ? and bookid = ?");
		q.setParameter(0, userid);
		q.setParameter(1, bookid);
		return (Shoppingcart)q.uniqueResult();
	}
	public void update(int userid,int bookid,int count) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("update Shoppingcart set quantity = ? where userid = ? and bookid = ?");
		q.setParameter(0,count);
		q.setParameter(1, userid);
		q.setParameter(2, bookid);
		q.executeUpdate();
	}
	public void delete(int userid,int bookid) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("delete Shoppingcart s where s.userid = ? and s.bookid = ?");
		q.setParameter(0, userid);
		q.setParameter(1, bookid);
		q.executeUpdate();
	}
	public void deleteByid(int id) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("delete Shoppingcart s where s.id = ?");
		q.setParameter(0, id);
		q.executeUpdate();
	}
	
	public void save(int userid,int bookid,String bookname,String bookauthor,int bookprice,String bookimage) {
		Shoppingcart cart = new Shoppingcart();
		cart.setBookid(bookid);
		cart.setUserid(userid);
		cart.setQuantity(1);
		cart.setBookname(bookname);
		cart.setBookauthor(bookauthor);
		cart.setBookprice(bookprice);
		cart.setBookimage(bookimage);
		Session s=this.sessionFactory.openSession();
		org.hibernate.Transaction t=s.beginTransaction();
		s.saveOrUpdate(cart);
		t.commit();
		s.close();
	}
}
